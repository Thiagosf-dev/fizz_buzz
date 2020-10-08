# Creating a module
defmodule FizzBuzz do
  # Creating a function
  def build(file_name) do
    # Retrieving the contents of the file
    # file = File.read(file_name)
    # IO.inspect(file)

    # Retrieving the contents of the file using the Pattern Matching
    # {:ok, file} = File.read(file_name)
    # file

    # Retrieving the contents of the file using the Pattern Matching and the switch case
    # case File.read(file_name) do
    #   {:ok, result} -> result
    #   {:error, reason} -> reason
    # end

    # Retrieving the contents of the file using the Patterns Matching and an evaluation function
    # file = File.read(file_name)
    # handle_file_read(file)

    # Retrieving the contents of the file using the Patterns Matching, Pipe Operator and an evaluation function
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    # Convert String to List (to ex1 and ex2)
    # list = String.split(result, ",")    # ["1", "2", "3", "4", ...]

    # Convert each String value to an Integer number (ex1)
    # Enum.map(list, fn number -> String.to_integer(number) end)    # [1,2,3,4,...]

    # Convert each String value to an Integer number (ex2)
    # Enum.map(list, &String.to_integer/1)    # [1,2,3,4,...]

    # Convert each String value to an Integer number (ex3)
    # result
    # |> String.split(",")
    # |> Enum.map(&String.to_integer/1)

    # Convert each String value to an Integer number and replace the elements according to FizzBuzz logic
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  # Functions using Guards
  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) === 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
