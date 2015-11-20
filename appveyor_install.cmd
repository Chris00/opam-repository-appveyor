REM Environment variables set in appveyor.yml

echo Installing Cygwin in %CYG_ROOT% ...
mkdir "%CYG_ROOT%"
REM appveyor DownloadFile "http://cygwin.com/setup-%CYG_ARCH%.exe" -FileName "%CYG_ROOT%\setup-x86.exe"
"%CYG_ROOT%\setup-x86.exe" -qnNdO -R "%CYG_ROOT%" -s "%CYG_MIRROR%" -l "%CYG_CACHE%" -P make -P gcc-core -P ocaml -P ocaml-compiler-libs -P m4 -P tar -P patch -P flexdll >NUL

%CYG_ROOT%\bin\bash -lc "cygcheck -dc cygwin"
%CYG_ROOT%\bin\bash -lc "echo \"OCaml version `ocamlc -version`\""

echo ------------------------------------------------------------

if not exist %OPAM_DIR%\bin\opam (
  echo Compiling opam to %OPAM_DIR% ...
  mkdir "%OPAM_DIR%"
  git clone https://github.com/ocaml/opam.git C:\temp\opam
  %CYG_ROOT%\bin\bash -lc "cd \"/cygdrive/c/temp/opam\" && env DJDIR=workaround ./configure --prefix=%OPAM_DIR% && make lib-ext && make && make install"
)
