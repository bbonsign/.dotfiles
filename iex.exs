alias IO.ANSI

IO.puts(
  "#{ANSI.blue()}  #{ANSI.magenta()}   Welcome to Elixir   #{ANSI.blue()}  #{ANSI.reset()}\n"
)

# Editor to open code in using `open` function
System.put_env("ELIXIR_EDITOR", "kitty --execute #{System.fetch_env!("EDITOR")} __FILE__ &")

IEx.configure(
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :white,
      boolean: :red,
      nil: [:magenta, :bright]
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:yellow, :bright, :underline]
  ],
  default_prompt:
    "#{ANSI.green()}%prefix#{ANSI.reset()}" <>
      "[#{ANSI.magenta()}#{ANSI.reset()}" <>
      "#{ANSI.cyan()}%counter#{ANSI.reset()}]",
  alive_prompt:
    "#{ANSI.green()}%prefix#{ANSI.reset()}" <>
      "(#{ANSI.yellow()}%node#{ANSI.reset()}) " <>
      "[#{ANSI.magenta()}#{ANSI.reset()}" <>
      "#{ANSI.cyan()}%counter#{ANSI.reset()}]",
  history_size: 80,
  inspect: [
    charlists: :as_lists,
    pretty: true,
    limit: 30,
    width: 80
  ],
  width: 80
)

dwarves = [
  "Fili",
  "Kili",
  "Oin",
  "Gloin",
  "Thorin",
  "Dwalin",
  "Balin",
  "Bifur",
  "Bofur",
  "Bombur",
  "Dori",
  "Nori",
  "Ori"
]

fellowship = %{
  hobbits: ["Frodo", "Samwise", "Merry", "Pippin"],
  humans: ["Aragorn", "Boromir"],
  dwarves: ["Gimli"],
  elves: ["Legolas"],
  wizards: ["Gandolf"]
}

defmodule MyHelpers do
  def cl do
    IEx.Helpers.clear()
  end
end


import MyHelpers
require Integer
