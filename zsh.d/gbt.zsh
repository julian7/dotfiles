if false && whichX gbt; then
    export GBT_CARS='Os, Hostname, Dir, Git, Status, Sign'
    export GBT_CAR_DIR_DEPTH=9999
    PROMPT='$(gbt $?)'
fi
