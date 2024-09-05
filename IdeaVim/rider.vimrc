" Basic
    nmap zpm :action RiderNuGetManagePackagesForCurrentProjectAction<CR>
    nmap zef :action MethodUp<CR>jz{:<C-u>action SilentCodeCleanup<CR>
" [Unit Test]
    nmap zrs dd?]<CR>ko[SetUp]<CR>public<Space>void<Space>SetUp(){<CR>}<Esc>P:action SilentCodeCleanup<CR>
    vmap zrs s<Esc>?]<CR>ko[SetUp]<CR>public<Space>void<Space>SetUp(){<CR>}<Esc>P:action SilentCodeCleanup<CR>
    nmap zrx dd?SetUp<CR>j%P:action ReformatCode<CR>
    nmap zrc ?[Test]<CR>jj]}j:action MethodDown<CR>:action RiderUnitTestRunContextAction<CR>:action ActivateUnitTestsToolWindow<CR><Esc>
    nmap zcc :action RiderUnitTestRunContextAction<CR>
    nmap zuu :action MethodUp<CR>jvi{:<C-u>action SilentCodeCleanup<CR>:action MethodUp<CR><Esc>:action RiderUnitTestRepeatPreviousRunAction<CR>
    nmap zat y?[Test<CR>P/public<CR>$B:action ReformatCode<CR>
    nmap zra :action RiderUnitTestRunSolutionAction<CR>:action ActivateUnitTestsToolWindow<CR>
    vmap zra :action RiderUnitTestRunSolutionAction<CR>:action ActivateUnitTestsToolWindow<CR>
    nmap zrm ?[Test<CR>:action MethodDown<CR>:action RiderUnitTestRunContextAction<CR>:action ActivateUnitTestsToolWindow<CR>
	nmap zlt y?\[Test<CR>P/public<CR>$B:action ReformatCode<CR>
	imap zlt <Esc>zlt

