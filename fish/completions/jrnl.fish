set -l journals  (jrnl --list | awk '/*/ {print $2}')

function _get_tags
  set -l journals  (jrnl --list | awk '/*/ {print $2}')
  set -l tokens (commandline -o)
  set -l journal
  if string match -r '^@' -- $tokens[-1]
    set journal $tokens[2]
  else
    set journal $tokens[-1]
  end
  if contains -- $journal $journals
    jrnl $journal --tags | awk '/^[^[]/ {print $1}'
  end
end


# Disable file completions for the entire command
complete -c jrnl -f


complete -c jrnl -s v -l version -d 'Print version information'
complete -c jrnl -l debug        -d 'Print information useful for troubleshooting'
complete -c jrnl -s h -l help    -d 'Show this help message'
complete -c jrnl -l version      -d 'Print version information'
complete -c jrnl -l list         -d 'List all configured journals'
complete -c jrnl -l encrypt      -d 'Encrypt selected journal with a password'
complete -c jrnl -l decrypt      -d 'Decrypt selected journal and store it in plain text'

complete -c jrnl -l edit         -d 'Opens the selected entries in your configured editor'
complete -c jrnl -l delete       -d 'Interactively deletes selected entries'
complete -c jrnl -l tags         -d 'Returns a list of all tags and number of occurrences'
complete -c jrnl -l short        -d 'Show only titles or line containing the search tags'

complete -c jrnl -o contains     -d 'search'

complete -c jrnl -o on       -d  'Show entries on this DATE'
complete -c jrnl -o from     -d  'Show entries after, or on, this DATE'
complete -c jrnl -o to       -d  'Show entries before, or on, this DATE (alias: -until)'
complete -c jrnl -o to       -d  'Show entries before, or on, this DATE (alias: -to)'
complete -c jrnl -o contains -d  'Show entries containing specific text'
complete -c jrnl -o and      -d  'Show only entries that match all conditions (default: OR)'
complete -c jrnl -o starred  -d  'Show only starred entries (marked with *)'
complete -c jrnl -o n        -d  'Show a max of NUMBER entries ("-n 3" and "-3" have same effect)'
complete -c jrnl -o not      -d  'Exclude entries with this TAG'

complete -c jrnl -l 'format'   -d 'TYPE   Display selected entries in an alternate format.'
complete -c jrnl -n "__fish_seen_subcommand_from --format" -a "boxed fancy json markdown md tags text txt xml yaml"
complete -c jrnl -n "__fish_seen_subcommand_from --format" -l file -d "Write output to file instead of stdout"


complete -c jrnl -l import       -d 'Import entries from another journal.'


complete -c jrnl -n "not __fish_seen_subcommand_from $journals" -a "$journals"
complete -c jrnl -n "__fish_seen_subcommand_from $journals" -a "(_get_tags)"
