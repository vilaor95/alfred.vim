" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_alfred_plugin")
  finish
endif
let g:loaded_alfred_plugin = 1

"Prevent plugin loading if terminal capability is not supported
if !has('terminal')
  echom "Alfred plugin could not be loaded. Need terminal capability"
  finish
endif

let alfred_location = ""

let alfred_exe = "alfred.py"
let alfred_found = v:false

"Find alfred executable
"Look if alfred.py is in current dir. If not, look for fw_src dir and look for
"alfred.py in fw_src. If all of these fail, prevent loading.
let fw_dirs = ["", "fw_src/"]
for dir in fw_dirs
  if findfile(alfred_exe, dir) == dir . alfred_exe
    let alfred_found = v:true
    let alfred_location = dir . alfred_exe
  endif
endfor
if alfred_found == v:false
  finish
endif

"Run Alfred
command -nargs=0 AlfredRun              call alfred#Run()

"Build commands
command! -nargs=0 AlfredBuild           call alfred#BuildLastTarget()
command! -nargs=1 AlfredBuildTarget     call alfred#BuildTarget(<args>)
command! -nargs=0 AlfredBuildAll        call alfred#BuildAllTargets()

"Unit test commands
command! -nargs=1 AlfredUnitTestRun     call alfred#UnitTestRun(<args>)
command! -nargs=0 AlfredUnitTestRunAll  call alfred#UnitTestRunAll()

"Clean commands
command! -nargs=0 AlfredClean           call alfred#Clean()
