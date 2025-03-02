ame: Build
on: [push, pull_request, workflow_dispatch]

jobs:
  Build:
    name: Build Magisk Module
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v3
      with:
        fetch-depth: 0
    - name: Prepare files
      run: chmod +x compile.sh
    - name: Compile
      run: ./compile.sh
    - name: Upload Result
      uses: actions/upload-artifact@v3
      with:
        name: ViPER4AndroidRepackaged.zip
        path: |
          ViPER4AndroidFX-*.zip
          ViperIRS-*.zip
          ViperVDC-*.zip
        if-no-files-found: error
