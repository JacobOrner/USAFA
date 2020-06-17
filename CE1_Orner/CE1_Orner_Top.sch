<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="sw7" />
        <signal name="sw5" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="led0" />
        <signal name="sw6" />
        <signal name="XLXN_30" />
        <port polarity="Input" name="sw7" />
        <port polarity="Input" name="sw5" />
        <port polarity="Output" name="led0" />
        <port polarity="Input" name="sw6" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="XLXN_30" name="I0" />
            <blockpin signalname="sw7" name="I1" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="sw5" name="I0" />
            <blockpin signalname="sw6" name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_3">
            <blockpin signalname="XLXN_4" name="I0" />
            <blockpin signalname="XLXN_3" name="I1" />
            <blockpin signalname="led0" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_6">
            <blockpin signalname="sw6" name="I" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="sw5">
            <wire x2="736" y1="1072" y2="1072" x1="400" />
        </branch>
        <branch name="led0">
            <wire x2="1312" y1="960" y2="960" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1312" y="960" name="led0" orien="R0" />
        <instance x="1040" y="1056" name="XLXI_3" orien="R0" />
        <branch name="XLXN_4">
            <wire x2="1024" y1="1040" y2="1040" x1="992" />
            <wire x2="1040" y1="992" y2="992" x1="1024" />
            <wire x2="1024" y1="992" y2="1040" x1="1024" />
        </branch>
        <branch name="sw6">
            <wire x2="432" y1="1008" y2="1008" x1="400" />
            <wire x2="736" y1="1008" y2="1008" x1="432" />
            <wire x2="480" y1="912" y2="912" x1="432" />
            <wire x2="432" y1="912" y2="1008" x1="432" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1024" y1="880" y2="880" x1="992" />
            <wire x2="1024" y1="880" y2="928" x1="1024" />
            <wire x2="1040" y1="928" y2="928" x1="1024" />
        </branch>
        <branch name="sw7">
            <wire x2="720" y1="848" y2="848" x1="400" />
            <wire x2="736" y1="848" y2="848" x1="720" />
        </branch>
        <instance x="736" y="976" name="XLXI_1" orien="R0" />
        <branch name="XLXN_30">
            <wire x2="736" y1="912" y2="912" x1="704" />
        </branch>
        <instance x="736" y="1136" name="XLXI_2" orien="R0" />
        <iomarker fontsize="28" x="400" y="1072" name="sw5" orien="R180" />
        <iomarker fontsize="28" x="400" y="848" name="sw7" orien="R180" />
        <iomarker fontsize="28" x="400" y="1008" name="sw6" orien="R180" />
        <instance x="480" y="944" name="XLXI_6" orien="R0" />
    </sheet>
</drawing>