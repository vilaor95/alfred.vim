
function! alfred#Run()
  execute 'term' g:alfred_location
endfunction

"Build commands
function! alfred#BuildLastTarget()
  execute 'term'  g:alfred_location '--build'
endfunction

function! alfred#BuildTarget(target)
  execute 'term' g:alfred_location '--build --auto' a:target
endfunction

function! alfred#BuildAllTargets()
  call alfred#BuildTarget("*")
endfunction

"Unit test commands
function! alfred#UnitTestRun(target)
  execute 'term' g:alfred_location '--docker-tools --run-command --command bazel test' a:target
endfunction

function! alfred#UnitTestRunAll()
  execute 'term' g:alfred_location '--unit-tests --run --unit-tests-mode fast'
endfunction

"Clean
function! alfred#Clean()
  execute 'term' g:alfred_location '--mrproper'
endfunction
