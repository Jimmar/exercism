defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) when rem(length(rna), 3) != 0, do: {:error, "invalid RNA"}
  def of_rna(rna), do: String.split_at(rna, 3) |> of_rna([])

  defp of_rna({"", _rna}, proteins), do: {:ok, proteins |> Enum.reverse()}

  defp of_rna({codon_to_check, rna}, proteins) do
    case of_codon(codon_to_check) do
      {:error, _} -> {:error, "invalid RNA"}
      {:ok, "STOP"} -> of_rna({"", ""}, proteins)
      {:ok, protein} -> of_rna(String.split_at(rna, 3), [protein | proteins])
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case codoner(codon) do
      nil -> {:error, "invalid codon"}
      protein -> {:ok, protein}
    end
  end

  defp codoner(codon) do
    case codon do
      "UGU" -> "Cysteine"
      "UGC" -> "Cysteine"
      "UUA" -> "Leucine"
      "UUG" -> "Leucine"
      "AUG" -> "Methionine"
      "UUU" -> "Phenylalanine"
      "UUC" -> "Phenylalanine"
      "UCU" -> "Serine"
      "UCC" -> "Serine"
      "UCA" -> "Serine"
      "UCG" -> "Serine"
      "UGG" -> "Tryptophan"
      "UAU" -> "Tyrosine"
      "UAC" -> "Tyrosine"
      "UAA" -> "STOP"
      "UAG" -> "STOP"
      "UGA" -> "STOP"
      _ -> nil
    end
  end
end
