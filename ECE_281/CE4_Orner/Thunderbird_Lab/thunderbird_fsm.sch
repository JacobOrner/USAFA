<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_4" />
        <signal name="clk" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="Reset" />
        <signal name="lights_L(0)" />
        <signal name="XLXN_12" />
        <signal name="left" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="right" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="lights_L(1)" />
        <signal name="XLXN_35" />
        <signal name="XLXN_38" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="lights_L(2)" />
        <signal name="lights_R(0)" />
        <signal name="XLXN_45" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_50" />
        <signal name="XLXN_52" />
        <signal name="XLXN_55" />
        <signal name="XLXN_56" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_65" />
        <signal name="lights_R(1)" />
        <signal name="XLXN_71" />
        <signal name="XLXN_75" />
        <signal name="XLXN_76" />
        <signal name="XLXN_77" />
        <signal name="XLXN_80" />
        <signal name="lights_R(2)" />
        <signal name="lights_L(2:0)" />
        <signal name="lights_R(2:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="Reset" />
        <port polarity="Output" name="lights_L(0)" />
        <port polarity="Input" name="left" />
        <port polarity="Input" name="right" />
        <port polarity="Output" name="lights_L(1)" />
        <port polarity="Output" name="lights_L(2)" />
        <port polarity="Output" name="lights_R(0)" />
        <port polarity="Output" name="lights_R(1)" />
        <port polarity="Output" name="lights_R(2)" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
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
        <blockdef name="and5">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <arc ex="144" ey="-240" sx="144" sy="-144" r="48" cx="144" cy="-192" />
            <line x2="64" y1="-144" y2="-144" x1="144" />
            <line x2="144" y1="-240" y2="-240" x1="64" />
            <line x2="64" y1="-64" y2="-320" x1="64" />
            <line x2="192" y1="-192" y2="-192" x1="256" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
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
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <blockdef name="and6">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="192" y1="-224" y2="-224" x1="256" />
            <line x2="144" y1="-272" y2="-272" x1="64" />
            <line x2="64" y1="-176" y2="-176" x1="144" />
            <arc ex="144" ey="-272" sx="144" sy="-176" r="48" cx="144" cy="-224" />
            <line x2="64" y1="-64" y2="-384" x1="64" />
        </blockdef>
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
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
        <block symbolname="fd" name="XLXI_1">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_1" name="D" />
            <blockpin signalname="lights_L(0)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_2">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_19" name="D" />
            <blockpin signalname="XLXN_18" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_3">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_30" name="D" />
            <blockpin signalname="XLXN_40" name="Q" />
        </block>
        <block symbolname="or2" name="XLXI_4">
            <blockpin signalname="XLXN_4" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="and5" name="XLXI_5">
            <blockpin signalname="XLXN_17" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="XLXN_12" name="I2" />
            <blockpin signalname="left" name="I3" />
            <blockpin signalname="XLXN_8" name="I4" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_6">
            <blockpin signalname="XLXN_18" name="I0" />
            <blockpin signalname="lights_L(0)" name="I1" />
            <blockpin signalname="XLXN_8" name="I2" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_7">
            <blockpin signalname="Reset" name="I" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin name="I" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_10">
            <blockpin signalname="XLXN_18" name="I" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_11">
            <blockpin signalname="XLXN_40" name="I" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_12">
            <blockpin signalname="XLXN_27" name="I0" />
            <blockpin signalname="XLXN_26" name="I1" />
            <blockpin signalname="XLXN_20" name="I2" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="and6" name="XLXI_14">
            <blockpin signalname="right" name="I0" />
            <blockpin signalname="left" name="I1" />
            <blockpin signalname="XLXN_17" name="I2" />
            <blockpin signalname="XLXN_15" name="I3" />
            <blockpin signalname="XLXN_12" name="I4" />
            <blockpin signalname="XLXN_8" name="I5" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_15">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="XLXN_8" name="I2" />
            <blockpin signalname="XLXN_26" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_16">
            <blockpin signalname="XLXN_17" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="XLXN_12" name="I2" />
            <blockpin signalname="XLXN_8" name="I3" />
            <blockpin signalname="XLXN_27" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_18">
            <blockpin signalname="XLXN_33" name="I0" />
            <blockpin signalname="XLXN_32" name="I1" />
            <blockpin signalname="XLXN_31" name="I2" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
        <block symbolname="and5" name="XLXI_20">
            <blockpin signalname="right" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="XLXN_15" name="I2" />
            <blockpin signalname="XLXN_12" name="I3" />
            <blockpin signalname="XLXN_8" name="I4" />
            <blockpin signalname="XLXN_31" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_21">
            <blockpin signalname="XLXN_17" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="XLXN_12" name="I2" />
            <blockpin signalname="XLXN_8" name="I3" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_22">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="lights_L(0)" name="I2" />
            <blockpin signalname="XLXN_8" name="I3" />
            <blockpin signalname="XLXN_33" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_23">
            <blockpin signalname="XLXN_38" name="I0" />
            <blockpin signalname="XLXN_35" name="I1" />
            <blockpin signalname="lights_L(1)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_24">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="lights_L(0)" name="I1" />
            <blockpin signalname="XLXN_35" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_25">
            <blockpin signalname="XLXN_42" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="lights_L(0)" name="I2" />
            <blockpin signalname="XLXN_38" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_26">
            <blockpin signalname="XLXN_40" name="I" />
            <blockpin signalname="XLXN_42" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_27">
            <blockpin signalname="XLXN_18" name="I0" />
            <blockpin signalname="lights_L(0)" name="I1" />
            <blockpin signalname="lights_L(2)" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_28">
            <blockpin signalname="XLXN_52" name="I0" />
            <blockpin signalname="XLXN_47" name="I1" />
            <blockpin signalname="XLXN_45" name="I2" />
            <blockpin signalname="lights_R(0)" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_29">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="lights_L(0)" name="I2" />
            <blockpin signalname="XLXN_45" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_30">
            <blockpin signalname="XLXN_18" name="I0" />
            <blockpin signalname="XLXN_48" name="I1" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_31">
            <blockpin signalname="lights_L(0)" name="I" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_32">
            <blockpin signalname="lights_L(0)" name="I" />
            <blockpin signalname="XLXN_50" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_33">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="XLXN_50" name="I1" />
            <blockpin signalname="XLXN_52" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_34">
            <blockpin signalname="XLXN_59" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="lights_R(1)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_35">
            <blockpin signalname="XLXN_18" name="I0" />
            <blockpin signalname="XLXN_65" name="I1" />
            <blockpin signalname="XLXN_58" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_36">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="lights_L(0)" name="I2" />
            <blockpin signalname="XLXN_59" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_37">
            <blockpin signalname="lights_L(0)" name="I" />
            <blockpin signalname="XLXN_65" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_38">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="lights_R(2)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1488" y="1072" name="XLXI_2" orien="R0" />
        <instance x="1200" y="560" name="XLXI_4" orien="R0" />
        <instance x="928" y="352" name="XLXI_5" orien="R0" />
        <branch name="XLXN_2">
            <wire x2="1184" y1="160" y2="432" x1="1184" />
            <wire x2="1200" y1="432" y2="432" x1="1184" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1200" y1="496" y2="496" x1="1184" />
        </branch>
        <instance x="928" y="624" name="XLXI_6" orien="R0" />
        <branch name="clk">
            <wire x2="1472" y1="592" y2="592" x1="1424" />
            <wire x2="1472" y1="592" y2="944" x1="1472" />
            <wire x2="1488" y1="944" y2="944" x1="1472" />
            <wire x2="1472" y1="944" y2="1584" x1="1472" />
            <wire x2="1504" y1="1584" y2="1584" x1="1472" />
            <wire x2="1488" y1="592" y2="592" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="1424" y="592" name="clk" orien="R180" />
        <branch name="XLXN_8">
            <wire x2="432" y1="32" y2="32" x1="368" />
            <wire x2="928" y1="32" y2="32" x1="432" />
            <wire x2="432" y1="32" y2="432" x1="432" />
            <wire x2="928" y1="432" y2="432" x1="432" />
            <wire x2="432" y1="432" y2="592" x1="432" />
            <wire x2="912" y1="592" y2="592" x1="432" />
            <wire x2="432" y1="592" y2="960" x1="432" />
            <wire x2="912" y1="960" y2="960" x1="432" />
            <wire x2="432" y1="960" y2="1152" x1="432" />
            <wire x2="912" y1="1152" y2="1152" x1="432" />
            <wire x2="432" y1="1152" y2="1424" x1="432" />
            <wire x2="928" y1="1424" y2="1424" x1="432" />
            <wire x2="432" y1="1424" y2="1744" x1="432" />
            <wire x2="880" y1="1744" y2="1744" x1="432" />
            <wire x2="432" y1="1744" y2="2000" x1="432" />
            <wire x2="880" y1="2000" y2="2000" x1="432" />
        </branch>
        <branch name="Reset">
            <wire x2="144" y1="32" y2="32" x1="128" />
        </branch>
        <iomarker fontsize="28" x="128" y="32" name="Reset" orien="R180" />
        <instance x="144" y="64" name="XLXI_7" orien="R0" />
        <branch name="lights_L(0)">
            <wire x2="528" y1="160" y2="160" x1="80" />
            <wire x2="528" y1="160" y2="496" x1="528" />
            <wire x2="928" y1="496" y2="496" x1="528" />
            <wire x2="528" y1="496" y2="2064" x1="528" />
            <wire x2="880" y1="2064" y2="2064" x1="528" />
            <wire x2="80" y1="160" y2="2400" x1="80" />
            <wire x2="2080" y1="2400" y2="2400" x1="80" />
            <wire x2="2080" y1="464" y2="464" x1="1872" />
            <wire x2="3344" y1="464" y2="464" x1="2080" />
            <wire x2="2080" y1="464" y2="512" x1="2080" />
            <wire x2="2672" y1="512" y2="512" x1="2080" />
            <wire x2="2080" y1="512" y2="640" x1="2080" />
            <wire x2="2672" y1="640" y2="640" x1="2080" />
            <wire x2="2080" y1="640" y2="880" x1="2080" />
            <wire x2="2992" y1="880" y2="880" x1="2080" />
            <wire x2="2080" y1="880" y2="1040" x1="2080" />
            <wire x2="2592" y1="1040" y2="1040" x1="2080" />
            <wire x2="2080" y1="1040" y2="1248" x1="2080" />
            <wire x2="2416" y1="1248" y2="1248" x1="2080" />
            <wire x2="2080" y1="1248" y2="1376" x1="2080" />
            <wire x2="2416" y1="1376" y2="1376" x1="2080" />
            <wire x2="2080" y1="1376" y2="1504" x1="2080" />
            <wire x2="2416" y1="1504" y2="1504" x1="2080" />
            <wire x2="2080" y1="1504" y2="1648" x1="2080" />
            <wire x2="2080" y1="1648" y2="2400" x1="2080" />
            <wire x2="2672" y1="1648" y2="1648" x1="2080" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="560" y1="240" y2="240" x1="304" />
            <wire x2="560" y1="240" y2="656" x1="560" />
            <wire x2="912" y1="656" y2="656" x1="560" />
            <wire x2="560" y1="656" y2="1216" x1="560" />
            <wire x2="912" y1="1216" y2="1216" x1="560" />
            <wire x2="560" y1="1216" y2="1488" x1="560" />
            <wire x2="928" y1="1488" y2="1488" x1="560" />
            <wire x2="560" y1="1488" y2="1808" x1="560" />
            <wire x2="880" y1="1808" y2="1808" x1="560" />
            <wire x2="560" y1="160" y2="240" x1="560" />
            <wire x2="928" y1="160" y2="160" x1="560" />
        </branch>
        <branch name="left">
            <wire x2="400" y1="96" y2="96" x1="112" />
            <wire x2="928" y1="96" y2="96" x1="400" />
            <wire x2="400" y1="96" y2="848" x1="400" />
            <wire x2="912" y1="848" y2="848" x1="400" />
        </branch>
        <iomarker fontsize="28" x="112" y="96" name="left" orien="R180" />
        <instance x="80" y="272" name="XLXI_9" orien="R0" />
        <branch name="XLXN_15">
            <wire x2="640" y1="400" y2="400" x1="368" />
            <wire x2="640" y1="400" y2="720" x1="640" />
            <wire x2="912" y1="720" y2="720" x1="640" />
            <wire x2="640" y1="720" y2="1024" x1="640" />
            <wire x2="912" y1="1024" y2="1024" x1="640" />
            <wire x2="640" y1="1024" y2="1552" x1="640" />
            <wire x2="928" y1="1552" y2="1552" x1="640" />
            <wire x2="640" y1="1552" y2="2128" x1="640" />
            <wire x2="880" y1="2128" y2="2128" x1="640" />
            <wire x2="640" y1="224" y2="400" x1="640" />
            <wire x2="928" y1="224" y2="224" x1="640" />
        </branch>
        <instance x="144" y="432" name="XLXI_10" orien="R0" />
        <branch name="XLXN_17">
            <wire x2="720" y1="544" y2="544" x1="368" />
            <wire x2="720" y1="544" y2="784" x1="720" />
            <wire x2="912" y1="784" y2="784" x1="720" />
            <wire x2="720" y1="784" y2="1344" x1="720" />
            <wire x2="912" y1="1344" y2="1344" x1="720" />
            <wire x2="720" y1="1344" y2="1616" x1="720" />
            <wire x2="928" y1="1616" y2="1616" x1="720" />
            <wire x2="720" y1="1616" y2="1936" x1="720" />
            <wire x2="880" y1="1936" y2="1936" x1="720" />
            <wire x2="928" y1="288" y2="288" x1="720" />
            <wire x2="720" y1="288" y2="544" x1="720" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="112" y1="304" y2="400" x1="112" />
            <wire x2="112" y1="400" y2="2320" x1="112" />
            <wire x2="2000" y1="2320" y2="2320" x1="112" />
            <wire x2="144" y1="400" y2="400" x1="112" />
            <wire x2="608" y1="304" y2="304" x1="112" />
            <wire x2="608" y1="304" y2="560" x1="608" />
            <wire x2="928" y1="560" y2="560" x1="608" />
            <wire x2="608" y1="560" y2="1280" x1="608" />
            <wire x2="912" y1="1280" y2="1280" x1="608" />
            <wire x2="608" y1="1280" y2="1872" x1="608" />
            <wire x2="880" y1="1872" y2="1872" x1="608" />
            <wire x2="2000" y1="816" y2="816" x1="1872" />
            <wire x2="2000" y1="816" y2="944" x1="2000" />
            <wire x2="2992" y1="944" y2="944" x1="2000" />
            <wire x2="2000" y1="944" y2="1104" x1="2000" />
            <wire x2="2592" y1="1104" y2="1104" x1="2000" />
            <wire x2="2000" y1="1104" y2="1312" x1="2000" />
            <wire x2="2672" y1="1312" y2="1312" x1="2000" />
            <wire x2="2000" y1="1312" y2="1568" x1="2000" />
            <wire x2="2672" y1="1568" y2="1568" x1="2000" />
            <wire x2="2000" y1="1568" y2="1712" x1="2000" />
            <wire x2="2672" y1="1712" y2="1712" x1="2000" />
            <wire x2="2000" y1="1712" y2="1880" x1="2000" />
            <wire x2="2000" y1="1880" y2="1888" x1="2000" />
            <wire x2="2000" y1="1888" y2="2320" x1="2000" />
            <wire x2="2960" y1="1888" y2="1888" x1="2000" />
            <wire x2="2000" y1="704" y2="816" x1="2000" />
            <wire x2="2672" y1="704" y2="704" x1="2000" />
        </branch>
        <instance x="144" y="576" name="XLXI_11" orien="R0" />
        <branch name="XLXN_19">
            <wire x2="1488" y1="816" y2="816" x1="1456" />
        </branch>
        <instance x="1200" y="944" name="XLXI_12" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="1200" y1="752" y2="752" x1="1168" />
        </branch>
        <instance x="912" y="976" name="XLXI_14" orien="R0" />
        <branch name="right">
            <wire x2="368" y1="128" y2="128" x1="112" />
            <wire x2="368" y1="128" y2="912" x1="368" />
            <wire x2="912" y1="912" y2="912" x1="368" />
            <wire x2="368" y1="912" y2="1680" x1="368" />
            <wire x2="928" y1="1680" y2="1680" x1="368" />
        </branch>
        <iomarker fontsize="28" x="112" y="128" name="right" orien="R180" />
        <instance x="912" y="1152" name="XLXI_15" orien="R0" />
        <branch name="XLXN_26">
            <wire x2="1168" y1="816" y2="1024" x1="1168" />
            <wire x2="1200" y1="816" y2="816" x1="1168" />
        </branch>
        <instance x="912" y="1408" name="XLXI_16" orien="R0" />
        <branch name="XLXN_27">
            <wire x2="1200" y1="1248" y2="1248" x1="1168" />
            <wire x2="1200" y1="880" y2="1248" x1="1200" />
        </branch>
        <instance x="1504" y="1712" name="XLXI_3" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1488" y1="464" y2="464" x1="1456" />
        </branch>
        <instance x="1488" y="720" name="XLXI_1" orien="R0" />
        <branch name="XLXN_30">
            <wire x2="1440" y1="1840" y2="1840" x1="1424" />
            <wire x2="1440" y1="1456" y2="1840" x1="1440" />
            <wire x2="1504" y1="1456" y2="1456" x1="1440" />
        </branch>
        <instance x="1168" y="1968" name="XLXI_18" orien="R0" />
        <branch name="XLXN_31">
            <wire x2="1152" y1="1712" y2="1776" x1="1152" />
            <wire x2="1168" y1="1776" y2="1776" x1="1152" />
            <wire x2="1264" y1="1712" y2="1712" x1="1152" />
            <wire x2="1264" y1="1552" y2="1552" x1="1184" />
            <wire x2="1264" y1="1552" y2="1712" x1="1264" />
        </branch>
        <instance x="928" y="1744" name="XLXI_20" orien="R0" />
        <branch name="XLXN_32">
            <wire x2="1168" y1="1840" y2="1840" x1="1136" />
        </branch>
        <instance x="880" y="2000" name="XLXI_21" orien="R0" />
        <instance x="880" y="2256" name="XLXI_22" orien="R0" />
        <branch name="XLXN_33">
            <wire x2="1168" y1="2096" y2="2096" x1="1136" />
            <wire x2="1168" y1="1904" y2="2096" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="3344" y="464" name="lights_L(0)" orien="R0" />
        <branch name="lights_L(1)">
            <wire x2="3344" y1="576" y2="576" x1="3264" />
        </branch>
        <branch name="lights_L(2)">
            <wire x2="3344" y1="912" y2="912" x1="3248" />
        </branch>
        <branch name="lights_R(0)">
            <wire x2="3344" y1="1280" y2="1280" x1="3328" />
        </branch>
        <branch name="XLXN_45">
            <wire x2="3072" y1="1104" y2="1104" x1="2848" />
            <wire x2="3072" y1="1104" y2="1216" x1="3072" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="2672" y1="1248" y2="1248" x1="2640" />
        </branch>
        <branch name="XLXN_52">
            <wire x2="3072" y1="1408" y2="1408" x1="2928" />
            <wire x2="3072" y1="1344" y2="1408" x1="3072" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="3072" y1="1280" y2="1280" x1="2928" />
        </branch>
        <branch name="XLXN_50">
            <wire x2="2672" y1="1376" y2="1376" x1="2640" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="2672" y1="1504" y2="1504" x1="2640" />
        </branch>
        <branch name="lights_R(1)">
            <wire x2="3344" y1="1600" y2="1600" x1="3280" />
        </branch>
        <instance x="2672" y="640" name="XLXI_24" orien="R0" />
        <branch name="XLXN_35">
            <wire x2="3008" y1="544" y2="544" x1="2928" />
        </branch>
        <instance x="3008" y="672" name="XLXI_23" orien="R0" />
        <branch name="XLXN_38">
            <wire x2="2992" y1="704" y2="704" x1="2928" />
            <wire x2="3008" y1="608" y2="608" x1="2992" />
            <wire x2="2992" y1="608" y2="704" x1="2992" />
        </branch>
        <instance x="2672" y="832" name="XLXI_25" orien="R0" />
        <instance x="2400" y="800" name="XLXI_26" orien="R0" />
        <branch name="XLXN_42">
            <wire x2="2672" y1="768" y2="768" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="3344" y="576" name="lights_L(1)" orien="R0" />
        <instance x="2992" y="1008" name="XLXI_27" orien="R0" />
        <iomarker fontsize="28" x="3344" y="912" name="lights_L(2)" orien="R0" />
        <instance x="2592" y="1232" name="XLXI_29" orien="R0" />
        <branch name="XLXN_40">
            <wire x2="144" y1="464" y2="544" x1="144" />
            <wire x2="144" y1="544" y2="2240" x1="144" />
            <wire x2="1952" y1="2240" y2="2240" x1="144" />
            <wire x2="688" y1="464" y2="464" x1="144" />
            <wire x2="688" y1="464" y2="1088" x1="688" />
            <wire x2="912" y1="1088" y2="1088" x1="688" />
            <wire x2="688" y1="1088" y2="2192" x1="688" />
            <wire x2="880" y1="2192" y2="2192" x1="688" />
            <wire x2="1952" y1="1456" y2="1456" x1="1888" />
            <wire x2="1952" y1="1456" y2="1776" x1="1952" />
            <wire x2="2672" y1="1776" y2="1776" x1="1952" />
            <wire x2="1952" y1="1776" y2="1952" x1="1952" />
            <wire x2="1952" y1="1952" y2="2240" x1="1952" />
            <wire x2="2960" y1="1952" y2="1952" x1="1952" />
            <wire x2="2672" y1="576" y2="576" x1="1952" />
            <wire x2="1952" y1="576" y2="768" x1="1952" />
            <wire x2="2400" y1="768" y2="768" x1="1952" />
            <wire x2="1952" y1="768" y2="1168" x1="1952" />
            <wire x2="2592" y1="1168" y2="1168" x1="1952" />
            <wire x2="1952" y1="1168" y2="1440" x1="1952" />
            <wire x2="1952" y1="1440" y2="1456" x1="1952" />
            <wire x2="2672" y1="1440" y2="1440" x1="1952" />
        </branch>
        <instance x="2416" y="1280" name="XLXI_31" orien="R0" />
        <instance x="2672" y="1376" name="XLXI_30" orien="R0" />
        <instance x="3072" y="1408" name="XLXI_28" orien="R0" />
        <iomarker fontsize="28" x="3344" y="1280" name="lights_R(0)" orien="R0" />
        <instance x="2416" y="1408" name="XLXI_32" orien="R0" />
        <instance x="2672" y="1504" name="XLXI_33" orien="R0" />
        <instance x="2416" y="1536" name="XLXI_37" orien="R0" />
        <instance x="2672" y="1632" name="XLXI_35" orien="R0" />
        <instance x="3024" y="1696" name="XLXI_34" orien="R0" />
        <branch name="XLXN_58">
            <wire x2="2944" y1="1536" y2="1536" x1="2928" />
            <wire x2="2944" y1="1536" y2="1568" x1="2944" />
            <wire x2="3024" y1="1568" y2="1568" x1="2944" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="3008" y1="1712" y2="1712" x1="2928" />
            <wire x2="3024" y1="1632" y2="1632" x1="3008" />
            <wire x2="3008" y1="1632" y2="1712" x1="3008" />
        </branch>
        <iomarker fontsize="28" x="3344" y="1600" name="lights_R(1)" orien="R0" />
        <instance x="2672" y="1840" name="XLXI_36" orien="R0" />
        <instance x="2960" y="2016" name="XLXI_38" orien="R0" />
        <branch name="lights_R(2)">
            <wire x2="3248" y1="1920" y2="1920" x1="3216" />
        </branch>
        <iomarker fontsize="28" x="3248" y="1920" name="lights_R(2)" orien="R0" />
        <branch name="lights_L(2:0)">
            <wire x2="2464" y1="2096" y2="2096" x1="2208" />
        </branch>
        <branch name="lights_R(2:0)">
            <wire x2="2880" y1="2096" y2="2096" x1="2560" />
        </branch>
    </sheet>
</drawing>