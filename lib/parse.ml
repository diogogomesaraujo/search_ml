let parse s =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let parse_from_file file_path =
  let read_lines file_path =
    let contents =
      In_channel.with_open_bin
        file_path
        In_channel.input_all
    in
    String.split_on_char '\n' contents
  in
  let lines = read_lines file_path in
  List.filter_map( fun l ->
    match String.length l with
    | 0 -> None
    | _ -> Some (parse l)
  ) lines
