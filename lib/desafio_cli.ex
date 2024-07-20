defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    IO.puts(showToolBanner())
    names = %{}
    registry = get_and_save_names(names, [])
    show_monarchs_names(registry)
  end

  defp get_and_save_names(names, monarchs_list) do
    name = IO.gets("") |> String.trim()

    if name == "" do
      monarchs_list
    else
      {updated_names, count} = update_names_count(names, name)
      updated_monarchs = monarchs_list ++ [get_name_with_roman(name, count)]
      get_and_save_names(updated_names, updated_monarchs)
    end
  end

  defp update_names_count(names, name) do
    counter = Map.get(names, name, 0) + 1
    {Map.put(names, name, counter), counter}
  end

  def get_name_with_roman(name, number) do
    "#{name} #{convert_to_roman(number)}"
  end

  defp convert_to_roman(number) do
    {status, roman} = DesafioCli.Cldr.Number.to_string number, format: :roman
    if status == :ok do
      roman
    end
  end

  def show_monarchs_names(registry) do
    Enum.each(registry, fn x -> IO.puts(x) end)
  end

  def showToolBanner do
    IO.puts("
============================================ BEM-VINDO AO ============================================
          .        :       ...   :::.    :::.  :::.    :::::::..     .,-:::::   ::   .:
          ;;,.    ;;;   .;;;;;;;.`;;;;,  `;;;  ;;`;;   ;;;;``;;;;  ,;;;'````'  ,;;   ;;,
          [[[[, ,[[[[, ,[[     \[[,[[[[[. '[[ ,[[ '[[,  [[[,/[[['  [[[        ,[[[,,,[[[
          $$$$$$$$'$$$ $$$,     $$$$$$ 'Y$c$$c$$$cc$$$c $$$$$$c    $$$        '$$$'''$$$
          888 Y88' 888o'888,_ _,88P888    Y88 888   888,888b '88bo,`88bo,__,o, 888   '88o
          MMM  M'  'MMM  'YMMMMMP' MMM     YM YMM   ''` MMMM   'W'   'YUMMMMMP'MMM    YMM
            :::::::::::::::::::..    :::.       .,-:::::  :::  .   .,:::::: :::::::..
            ;;;;;;;;'''';;;;``;;;;   ;;`;;    ,;;;'````'  ;;; .;;,.;;;;'''' ;;;;``;;;;
                [[      [[[,/[[['  ,[[ '[[,  [[[         [[[[[/'   [[cccc   [[[,/[[['
                $$      $$$$$$c   c$$$cc$$$c $$$        _$$$$,     $$''''   $$$$$$c
                88,     888b '88bo,888   888,`88bo,__,o,'888'88o,  888oo,__ 888b '88bo,
                MMM     MMMM   'W' YMM   ''`   'YUMMMMMP'MMM 'MMP' ''''YUMMMMMMM   'W'
======================================================================================================

    Para recuperar os registros reais de Cumbúquia, digite os nomes dos membros da família real,
      um por linha. Ao final, aperte 'Enter' uma última vez para receber o registro correto:\n")
  end
end
