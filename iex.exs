IO.puts "#{IO.ANSI.blue}  #{IO.ANSI.magenta}   Welcome to Elixir   #{IO.ANSI.blue}  #{IO.ANSI.reset}\n"

# Editor to open code in using `open` function
System.put_env("ELIXIR_EDITOR", "kitty --execute nvim __FILE__:__LINE__ &")

IEx.configure(
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :white,
      boolean: :red,
      nil: [:magenta, :bright],
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:yellow, :bright, :underline],
  ],
  default_prompt:
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset}" <>
    "[#{IO.ANSI.magenta}#{IO.ANSI.reset}" <>
    "#{IO.ANSI.cyan}%counter#{IO.ANSI.reset}]",
  alive_prompt:
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset}" <>
    "(#{IO.ANSI.yellow}%node#{IO.ANSI.reset}) " <>
    "[#{IO.ANSI.magenta}#{IO.ANSI.reset}" <>
    "#{IO.ANSI.cyan}%counter#{IO.ANSI.reset}]",
  history_size: 50,
  inspect: [
    pretty: true,
    limit: 30,
    width: 80
  ],
  width: 80
)

dwarves = ["Fili","Kili", "Oin", "Gloin", "Thorin", "Dwalin", "Balin", "Bifur",
           "Bofur", "Bombur", "Dori", "Nori", "Ori"]
fellowship = %{
  hobbits: ["Frodo", "Samwise", "Merry", "Pippin"],
  humans: ["Aragorn", "Boromir"],
  dwarves: ["Gimli"],
  elves: ["Legolas"],
  wizards: ["Gandolf"]
}
