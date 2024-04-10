defmodule Summation do
  import Decimal

  def main do
    IO.puts("Digite x:")
    x = Decimal.new(IO.gets("") |> String.trim())

    # Converte para radiano 0 < x < 2PI
    pi = Decimal.from_float(:math.pi())
    x = Decimal.mult(x, Decimal.div(pi, Decimal.new(180)))

    IO.puts("Digite epsilon:")
    epsilon = Decimal.new(IO.gets("") |> String.trim())

    cos(x, epsilon, 1, Decimal.new(1), Decimal.new(0))
  end

  def cos(x, epsilon, n, termo_atual, termo_anterior) do
    dif = Decimal.abs(Decimal.sub(termo_atual, termo_anterior))
    IO.puts("t: #{termo_atual} #{Decimal.compare(dif, epsilon)}, #{epsilon}")

    if Decimal.compare(dif, epsilon) == :lt do
      termo_atual
    else
      termo_novo = Decimal.add(termo_atual, termo(x, n))
      cos(x, epsilon, n + 1, termo_novo, termo_atual)
    end
  end

  def termo(x, n) do
    Decimal.div(Decimal.mult(potentencia(x, n * 2), potentencia(-1, n)), fatorial(n * 2))
  end

  def potentencia(base, 0), do: Decimal.new(1)
  def potentencia(base, exp) do
    Decimal.mult(base, potentencia(base, exp - 1))
  end

  def fatorial(0), do: Decimal.new(1)
  def fatorial(base) do
    Decimal.mult(base, fatorial(Decimal.sub(base, Decimal.new(1))))
  end
end
