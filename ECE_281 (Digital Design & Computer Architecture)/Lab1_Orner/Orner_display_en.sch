<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="sseg_sel0" />
        <signal name="sseg_sel_n3" />
        <signal name="sseg_sel_n1" />
        <signal name="sseg_sel_n0" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="sseg_sel3" />
        <signal name="sseg_sel1" />
        <signal name="sseg_sel_n2" />
        <signal name="XLXN_15" />
        <signal name="sseg_sel2" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <port polarity="Input" name="sseg_sel0" />
        <port polarity="Output" name="sseg_sel_n3" />
        <port polarity="Output" name="sseg_sel_n1" />
        <port polarity="Output" name="sseg_sel_n0" />
        <port polarity="Input" name="sseg_sel3" />
        <port polarity="Input" name="sseg_sel1" />
        <port polarity="Output" name="sseg_sel_n2" />
        <port polarity="Input" name="sseg_sel2" />
        <blockdef name="inv4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="160" y1="-96" y2="-96" x1="224" />
            <line x2="160" y1="-160" y2="-160" x1="224" />
            <line x2="160" y1="-224" y2="-224" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="64" y1="-160" y2="-160" x1="0" />
            <line x2="64" y1="-224" y2="-224" x1="0" />
            <line x2="128" y1="-256" y2="-224" x1="64" />
            <line x2="64" y1="-224" y2="-192" x1="128" />
            <line x2="64" y1="-192" y2="-256" x1="64" />
            <circle r="16" cx="144" cy="-32" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="128" y1="-128" y2="-96" x1="64" />
            <line x2="64" y1="-96" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="-128" x1="64" />
            <circle r="16" cx="144" cy="-96" />
            <line x2="128" y1="-192" y2="-160" x1="64" />
            <line x2="64" y1="-160" y2="-128" x1="128" />
            <line x2="64" y1="-128" y2="-192" x1="64" />
            <circle r="16" cx="144" cy="-160" />
            <circle r="16" cx="144" cy="-224" />
        </blockdef>
        <block symbolname="inv4" name="XLXI_11">
            <blockpin signalname="sseg_sel0" name="I0" />
            <blockpin signalname="sseg_sel1" name="I1" />
            <blockpin signalname="sseg_sel2" name="I2" />
            <blockpin signalname="sseg_sel3" name="I3" />
            <blockpin signalname="sseg_sel_n0" name="O0" />
            <blockpin signalname="sseg_sel_n1" name="O1" />
            <blockpin signalname="sseg_sel_n2" name="O2" />
            <blockpin signalname="sseg_sel_n3" name="O3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="sseg_sel1">
            <wire x2="816" y1="416" y2="416" x1="336" />
        </branch>
        <iomarker fontsize="28" x="1536" y="352" name="sseg_sel_n2" orien="R0" />
        <branch name="sseg_sel_n2">
            <wire x2="1536" y1="352" y2="352" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1536" y="416" name="sseg_sel_n1" orien="R0" />
        <branch name="sseg_sel_n1">
            <wire x2="1536" y1="416" y2="416" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1536" y="480" name="sseg_sel_n0" orien="R0" />
        <branch name="sseg_sel_n0">
            <wire x2="1536" y1="480" y2="480" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1536" y="288" name="sseg_sel_n3" orien="R0" />
        <branch name="sseg_sel_n3">
            <wire x2="1536" y1="288" y2="288" x1="1040" />
        </branch>
        <branch name="sseg_sel3">
            <wire x2="816" y1="288" y2="288" x1="336" />
        </branch>
        <branch name="sseg_sel2">
            <wire x2="816" y1="352" y2="352" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="352" name="sseg_sel2" orien="R180" />
        <iomarker fontsize="28" x="336" y="288" name="sseg_sel3" orien="R180" />
        <iomarker fontsize="28" x="336" y="416" name="sseg_sel1" orien="R180" />
        <iomarker fontsize="28" x="336" y="480" name="sseg_sel0" orien="R180" />
        <branch name="sseg_sel0">
            <wire x2="816" y1="480" y2="480" x1="336" />
        </branch>
        <instance x="816" y="512" name="XLXI_11" orien="R0" />
    </sheet>
</drawing>