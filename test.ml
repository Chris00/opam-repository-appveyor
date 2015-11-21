open Printf

let () =
  let fn = Filename.temp_file "test" ".txt" in
  printf "*** %S\n" fn;
  let fh = open_out fn in
  fprintf fh "test\n";
  close_out fh
