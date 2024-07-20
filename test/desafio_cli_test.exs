defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  test "teste padrao" do
    Enum.each [
        ["Eduardo", 1, "Eduardo I"],
        ["Maria", 1, "Maria I"],
        ["Daniel", 1, "Daniel I"],
        ["Eduardo", 2, "Eduardo II"]],
        fn [name, number, output] ->
          assert output == DesafioCli.get_name_with_roman(name, number)
        end
  end

  test "teste numeros pequenos" do
    Enum.each [
        ["Eduardo", 1, "Eduardo I"],
        ["Maria", 1, "Maria I"],
        ["Daniel", 1, "Daniel I"],
        ["Eduardo", 2, "Eduardo II"],
        ["Maria", 2, "Maria II"],
        ["Maria", 3, "Maria III"],
        ["Maria", 4, "Maria IV"],
        ["Joaquina", 1, "Joaquina I"],
        ["Pedro", 1, "Pedro I"],
        ["Pedro", 2, "Pedro II"],
        ["Sherlock", 1, "Sherlock I"]],
        fn [name, number, output] ->
          assert output == DesafioCli.get_name_with_roman(name, number)
        end
  end

  test "teste numeros maiores" do
    Enum.each [
        ["Tupperware", 1, "Tupperware I"],
        ["Tupperware", 8, "Tupperware VIII"],
        ["Tupperware", 9, "Tupperware IX"],
        ["Tupperware", 10, "Tupperware X"],
        ["Tupperware", 13, "Tupperware XIII"],
        ["Tupperware", 67, "Tupperware LXVII"],
        ["Tupperware", 109, "Tupperware CIX"],
        ["Tupperware", 1024, "Tupperware MXXIV"]],
        fn [name, number, output] ->
          assert output == DesafioCli.get_name_with_roman(name, number)
        end
  end

  test "maior numero" do
    assert "O ultimo Cumbuquio MMMCMXCIX" == DesafioCli.get_name_with_roman("O ultimo Cumbuquio", 3999)
  end
end
