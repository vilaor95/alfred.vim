let s:termCLI = 'term ++curwin'

function! alfred#CreateNewWindowAtBottom(height)
  bot new
  resize 20 
endfunction

function! alfred#Run()
  call alfred#CreateNewWindowAtBottom(0)
  execute s:termCLI './'.g:alfred_location
endfunction

"Build commands
function! alfred#BuildLastTarget()
  call alfred#CreateNewWindowAtBottom(0)
  let s:command_line = '--build'
  execute s:termCLI  './'.g:alfred_location s:command_line
endfunction

function! alfred#BuildTarget(target)
  call alfred#CreateNewWindowAtBottom(0)
  let s:command_line = '--build --select-targets --auto'
  execute s:termCLI './'.g:alfred_location  s:command_line "'".a:target."'"
endfunction

function! alfred#BuildAllTargets()
  call alfred#BuildTarget("*")
endfunction

"Unit test commands
function! alfred#UnitTestRun(target)
  call alfred#CreateNewWindowAtBottom(0)
  let s:command_line = '--unit-tests --run --unit-test-filter '.a:target.' --unit-tests-mode fast'
  execute s:termCLI './'.g:alfred_location s:command_line
endfunction

function! alfred#UnitTestRunAll()
  call alfred#CreateNewWindowAtBottom(0)
  call alfred#UnitTestRun('ALL')
endfunction

"Clean
function! alfred#Clean()
  call alfred#CreateNewWindowAtBottom(0)
  let s:command_line = '--mrproper'
  execute s:termCLI './'.g:alfred_location s:command_line
endfunction
