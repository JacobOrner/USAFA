<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="sw1" />
        <signal name="led1" />
        <signal name="led0" />
        <signal name="sw0" />
        <port polarity="Input" name="sw1" />
        <port polarity="Output" name="led1" />
        <port polarity="Output" name="led0" />
        <port polarity="Input" name="sw0" />
        <blockdef name="CE2_Orner_HA">
            <timestamp>2016-1-22T4:15:47</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="CE2_Orner_HA" name="XLXI_1">
            <blockpin signalname="sw0" name="B" />
            <blockpin signalname="sw1" name="A" />
            <blockpin signalname="led1" name="C_out" />
            <blockpin signalname="led0" name="S" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="288" y="368" name="XLXI_1" orien="R0">
        </instance>
        <branch name="sw0">
            <wire x2="288" y1="272" y2="272" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="272" name="sw0" orien="R180" />
        <branch name="sw1">
            <wire x2="288" y1="336" y2="336" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="336" name="sw1" orien="R180" />
        <branch name="led1">
            <wire x2="704" y1="272" y2="272" x1="672" />
        </branch>
        <iomarker fontsize="28" x="704" y="272" name="led1" orien="R0" />
        <branch name="led0">
            <wire x2="704" y1="336" y2="336" x1="672" />
        </branch>
        <iomarker fontsize="28" x="704" y="336" name="led0" orien="R0" />
    </sheet>
</drawing>