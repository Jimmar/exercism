defmodule PaintByNumber do
  defp log2(num, log), do: if(2 ** log < num, do: log2(num, log + 1), else: log)
  def palette_bit_size(color_count), do: log2(color_count, 1)

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bits = color_count |> palette_bit_size()
    <<pixel_color_index::size(bits), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    bits = color_count |> palette_bit_size()
    <<first::size(bits), _::bitstring>> = picture
    first
  end

  def drop_first_pixel(<<>>, _), do: empty_picture()

  def drop_first_pixel(picture, color_count) do
    bits = color_count |> palette_bit_size()
    <<_first::size(bits), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
