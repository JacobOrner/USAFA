<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="sw6" />
        <signal name="sw3" />
        <signal name="sw2" />
        <signal name="XLXN_11" />
        <signal name="sw7" />
        <signal name="clk" />
        <signal name="Led(5:0)" />
        <signal name="Led(5:3)" />
        <signal name="Led(0:2)" />
        <port polarity="Input" name="sw6" />
        <port polarity="Input" name="sw3" />
        <port polarity="Input" name="sw2" />
        <port polarity="Input" name="sw7" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="Led(5:0)" />
        <blockdef name="thunderbird_fsm">
            <timestamp>2016-3-2T5:34:15</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="clock_divider">
            <timestamp>2016-3-2T5:43:4</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="thunderbird_fsm" name="XLXI_1">
            <blockpin signalname="XLXN_11" name="clk" />
            <blockpin signalname="sw6" name="Reset" />
            <blockpin signalname="sw3" name="left" />
            <blockpin signalname="sw2" name="right" />
            <blockpin signalname="Led(5:3)" name="lights_L(2:0)" />
            <blockpin signalname="Led(0:2)" name="lights_R(2:0)" />
        </block>
        <block symbolname="clock_divider" name="XLXI_6">
            <blockpin signalname="clk" name="clk_fast" />
            <blockpin signalname="sw7" name="reset" />
            <blockpin signalname="XLXN_11" name="clk_slow" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <iomarker fontsize="28" x="720" y="816" name="sw2" orien="R180" />
        <iomarker fontsize="28" x="720" y="752" name="sw3" orien="R180" />
        <iomarker fontsize="28" x="720" y="688" name="sw6" orien="R180" />
        <instance x="240" y="720" name="XLXI_6" orien="R0">
        </instance>
        <branch name="sw7">
            <wire x2="240" y1="688" y2="688" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="688" name="sw7" orien="R180" />
        <branch name="clk">
            <wire x2="240" y1="624" y2="624" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="624" name="clk" orien="R180" />
        <branch name="sw2">
            <wire x2="736" y1="816" y2="816" x1="720" />
        </branch>
        <branch name="sw3">
            <wire x2="736" y1="752" y2="752" x1="720" />
        </branch>
        <branch name="sw6">
            <wire x2="736" y1="688" y2="688" x1="720" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="640" y1="624" y2="624" x1="624" />
            <wire x2="736" y1="624" y2="624" x1="640" />
        </branch>
        <instance x="736" y="848" name="XLXI_1" orien="R0">
        </instance>
        <branch name="Led(5:0)">
            <wire x2="1280" y1="592" y2="624" x1="1280" />
            <wire x2="1280" y1="624" y2="816" x1="1280" />
            <wire x2="1280" y1="816" y2="848" x1="1280" />
            <wire x2="1312" y1="592" y2="592" x1="1280" />
        </branch>
        <bustap x2="1184" y1="624" y2="624" x1="1280" />
        <bustap x2="1184" y1="816" y2="816" x1="1280" />
        <branch name="Led(5:3)">
            <wire x2="1184" y1="624" y2="624" x1="1120" />
        </branch>
        <branch name="Led(0:2)">
            <wire x2="1184" y1="816" y2="816" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1312" y="592" name="Led(5:0)" orien="R0" />
    </sheet>
</drawing>