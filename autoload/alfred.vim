let s:termCLI = 'term ++curwin'

function! alfred#CreateNewWindowAtBottom(height)
  bot new
  resize 20 
endfunction

function! alfred#executeOnNewWindow(...)
  call alfred#CreateNewWindowAtBottom(0)
  let s:command = s:termCLI.' ./'.g:alfred_location
  if a:0
    let s:command = s:command.' '.a:1
  endif
  echo s:command
  execute s:command
endfunction

function! alfred#OpenDebugger(target)
  let s:command = '--unit-tests --debug-unit-test --unit-test-name '.a:target.' --debugger gdb'
  call alfred#executeOnNewWindow(s:command)
endfunction

function! alfred#Run()
  call alfred#executeOnNewWindow()
endfunction

"Build commands
function! alfred#BuildLastTarget()
  let s:command = '--build'
  call alfred#executeOnNewWindow(s:command)
endfunction

function! alfred#BuildTarget(target)
  let s:command = '--build --select-targets --auto'
  call alfred#executeOnNewWindow(s:command)
endfunction

function! alfred#BuildAllTargets()
  call alfred#BuildTarget("*")
endfunction

"Unit test commands
function! alfred#UnitTestRunMode(target, mode)
  let s:command = '--unit-tests --run --unit-test-filter '.a:target.' --unit-tests-mode '.a:mode
  call alfred#executeOnNewWindow(s:command)
endfunction

function! alfred#UnitTestRun(target)
  call alfred#UnitTestRunMode(a:target, 'fast')
endfunction

function! alfred#UnitTestDebug(target)
  call alfred#UnitTestRunMode(a:target, 'debug')
endfunction

function! alfred#UnitTestRunAll()
  call alfred#UnitTestRun('ALL')
endfunction

"Clean
function! alfred#Clean()
  let s:command = '--mrproper'
  call alfred#executeOnNewWindow(s:command)
endfunction
