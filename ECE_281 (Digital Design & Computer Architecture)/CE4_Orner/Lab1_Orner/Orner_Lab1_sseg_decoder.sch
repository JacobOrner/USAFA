<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="D3" />
        <signal name="D2" />
        <signal name="D1" />
        <signal name="D0" />
        <signal name="a" />
        <signal name="b" />
        <signal name="c" />
        <signal name="d" />
        <signal name="e" />
        <signal name="f" />
        <signal name="XLXN_32" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_56" />
        <signal name="XLXN_67" />
        <signal name="g" />
        <port polarity="Input" name="D3" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="D0" />
        <port polarity="Output" name="a" />
        <port polarity="Output" name="b" />
        <port polarity="Output" name="c" />
        <port polarity="Output" name="d" />
        <port polarity="Output" name="e" />
        <port polarity="Output" name="f" />
        <port polarity="Output" name="g" />
        <blockdef name="lut4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <rect width="256" x="64" y="-384" height="320" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="lut4" name="XLXI_1">
            <attr value="3812" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="a" name="O" />
        </block>
        <block symbolname="lut4" name="XLXI_3">
            <attr value="D860" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="b" name="O" />
        </block>
        <block symbolname="lut4" name="XLXI_4">
            <attr value="D004" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="c" name="O" />
        </block>
        <block symbolname="lut4" name="XLXI_5">
            <attr value="8692" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="d" name="O" />
        </block>
        <block symbolname="lut4" name="XLXI_6">
            <attr value="02BA" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="e" name="O" />
        </block>
        <block symbolname="lut4" name="XLXI_7">
            <attr value="308E" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="D3" name="I3" />
            <blockpin signalname="f" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_8">
            <blockpin signalname="XLXN_46" name="I0" />
            <blockpin signalname="XLXN_45" name="I1" />
            <blockpin signalname="g" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_9">
            <blockpin signalname="XLXN_67" name="I0" />
            <blockpin signalname="XLXN_56" name="I1" />
            <blockpin signalname="XLXN_32" name="I2" />
            <blockpin signalname="XLXN_45" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_11">
            <blockpin signalname="D3" name="I" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_13">
            <blockpin signalname="D1" name="I" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_14">
            <blockpin signalname="D2" name="I" />
            <blockpin signalname="XLXN_56" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_10">
            <blockpin signalname="D0" name="I0" />
            <blockpin signalname="D1" name="I1" />
            <blockpin signalname="D2" name="I2" />
            <blockpin signalname="XLXN_32" name="I3" />
            <blockpin signalname="XLXN_46" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="320" y="544" name="XLXI_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <branch name="D3">
            <wire x2="320" y1="224" y2="224" x1="288" />
        </branch>
        <iomarker fontsize="28" x="288" y="224" name="D3" orien="R180" />
        <branch name="D2">
            <wire x2="320" y1="288" y2="288" x1="288" />
        </branch>
        <iomarker fontsize="28" x="288" y="288" name="D2" orien="R180" />
        <branch name="D1">
            <wire x2="320" y1="352" y2="352" x1="288" />
        </branch>
        <iomarker fontsize="28" x="288" y="352" name="D1" orien="R180" />
        <branch name="D0">
            <wire x2="320" y1="416" y2="416" x1="288" />
        </branch>
        <iomarker fontsize="28" x="288" y="416" name="D0" orien="R180" />
        <branch name="a">
            <wire x2="736" y1="352" y2="352" x1="704" />
        </branch>
        <iomarker fontsize="28" x="736" y="352" name="a" orien="R0" />
        <instance x="1056" y="544" name="XLXI_3" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <branch name="D3">
            <wire x2="1056" y1="224" y2="224" x1="1024" />
        </branch>
        <branch name="D2">
            <wire x2="1056" y1="288" y2="288" x1="1024" />
        </branch>
        <branch name="D1">
            <wire x2="1056" y1="352" y2="352" x1="1024" />
        </branch>
        <branch name="D0">
            <wire x2="1056" y1="416" y2="416" x1="1024" />
        </branch>
        <branch name="b">
            <wire x2="1472" y1="352" y2="352" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1024" y="224" name="D3" orien="R180" />
        <iomarker fontsize="28" x="1024" y="288" name="D2" orien="R180" />
        <iomarker fontsize="28" x="1024" y="352" name="D1" orien="R180" />
        <iomarker fontsize="28" x="1024" y="416" name="D0" orien="R180" />
        <iomarker fontsize="28" x="1472" y="352" name="b" orien="R0" />
        <instance x="1856" y="544" name="XLXI_4" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <branch name="D3">
            <wire x2="1856" y1="224" y2="224" x1="1824" />
        </branch>
        <branch name="D2">
            <wire x2="1856" y1="288" y2="288" x1="1824" />
        </branch>
        <branch name="D1">
            <wire x2="1856" y1="352" y2="352" x1="1824" />
        </branch>
        <branch name="D0">
            <wire x2="1856" y1="416" y2="416" x1="1824" />
        </branch>
        <branch name="c">
            <wire x2="2272" y1="352" y2="352" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="1824" y="224" name="D3" orien="R180" />
        <iomarker fontsize="28" x="1824" y="288" name="D2" orien="R180" />
        <iomarker fontsize="28" x="1824" y="352" name="D1" orien="R180" />
        <iomarker fontsize="28" x="1824" y="416" name="D0" orien="R180" />
        <iomarker fontsize="28" x="2272" y="352" name="c" orien="R0" />
        <instance x="320" y="1024" name="XLXI_5" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <branch name="D3">
            <wire x2="320" y1="704" y2="704" x1="288" />
        </branch>
        <branch name="D2">
            <wire x2="320" y1="768" y2="768" x1="288" />
        </branch>
        <branch name="D1">
            <wire x2="320" y1="832" y2="832" x1="288" />
        </branch>
        <branch name="D0">
            <wire x2="320" y1="896" y2="896" x1="288" />
        </branch>
        <branch name="d">
            <wire x2="736" y1="832" y2="832" x1="704" />
        </branch>
        <iomarker fontsize="28" x="288" y="704" name="D3" orien="R180" />
        <iomarker fontsize="28" x="288" y="768" name="D2" orien="R180" />
        <iomarker fontsize="28" x="288" y="832" name="D1" orien="R180" />
        <iomarker fontsize="28" x="288" y="896" name="D0" orien="R180" />
        <iomarker fontsize="28" x="736" y="832" name="d" orien="R0" />
        <instance x="1056" y="1024" name="XLXI_6" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <branch name="D3">
            <wire x2="1056" y1="704" y2="704" x1="1024" />
        </branch>
        <branch name="D2">
            <wire x2="1056" y1="768" y2="768" x1="1024" />
        </branch>
        <branch name="D1">
            <wire x2="1056" y1="832" y2="832" x1="1024" />
        </branch>
        <branch name="D0">
            <wire x2="1056" y1="896" y2="896" x1="1024" />
        </branch>
        <branch name="e">
            <wire x2="1472" y1="832" y2="832" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1024" y="704" name="D3" orien="R180" />
        <iomarker fontsize="28" x="1024" y="768" name="D2" orien="R180" />
        <iomarker fontsize="28" x="1024" y="832" name="D1" orien="R180" />
        <iomarker fontsize="28" x="1024" y="896" name="D0" orien="R180" />
        <iomarker fontsize="28" x="1472" y="832" name="e" orien="R0" />
        <instance x="1856" y="1024" name="XLXI_7" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <branch name="D3">
            <wire x2="1856" y1="704" y2="704" x1="1824" />
        </branch>
        <branch name="D2">
            <wire x2="1856" y1="768" y2="768" x1="1824" />
        </branch>
        <branch name="D1">
            <wire x2="1856" y1="832" y2="832" x1="1824" />
        </branch>
        <branch name="D0">
            <wire x2="1856" y1="896" y2="896" x1="1824" />
        </branch>
        <branch name="f">
            <wire x2="2272" y1="832" y2="832" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="1824" y="704" name="D3" orien="R180" />
        <iomarker fontsize="28" x="1824" y="768" name="D2" orien="R180" />
        <iomarker fontsize="28" x="1824" y="832" name="D1" orien="R180" />
        <iomarker fontsize="28" x="1824" y="896" name="D0" orien="R180" />
        <iomarker fontsize="28" x="2272" y="832" name="f" orien="R0" />
        <branch name="D3">
            <wire x2="448" y1="1184" y2="1184" x1="176" />
        </branch>
        <instance x="1696" y="1488" name="XLXI_8" orien="R0" />
        <branch name="XLXN_45">
            <wire x2="1680" y1="1312" y2="1312" x1="1568" />
            <wire x2="1680" y1="1312" y2="1360" x1="1680" />
            <wire x2="1696" y1="1360" y2="1360" x1="1680" />
        </branch>
        <branch name="XLXN_46">
            <wire x2="1680" y1="1664" y2="1664" x1="1552" />
            <wire x2="1696" y1="1424" y2="1424" x1="1680" />
            <wire x2="1680" y1="1424" y2="1664" x1="1680" />
        </branch>
        <branch name="XLXN_56">
            <wire x2="1312" y1="1312" y2="1312" x1="672" />
        </branch>
        <instance x="1312" y="1440" name="XLXI_9" orien="R0" />
        <instance x="448" y="1216" name="XLXI_11" orien="R0" />
        <iomarker fontsize="28" x="176" y="1184" name="D3" orien="R180" />
        <instance x="448" y="1344" name="XLXI_14" orien="R0" />
        <branch name="D2">
            <wire x2="432" y1="1312" y2="1312" x1="176" />
            <wire x2="448" y1="1312" y2="1312" x1="432" />
            <wire x2="432" y1="1312" y2="1632" x1="432" />
            <wire x2="1296" y1="1632" y2="1632" x1="432" />
        </branch>
        <iomarker fontsize="28" x="176" y="1312" name="D2" orien="R180" />
        <iomarker fontsize="28" x="176" y="1664" name="D1" orien="R180" />
        <branch name="XLXN_67">
            <wire x2="1296" y1="1440" y2="1440" x1="672" />
            <wire x2="1312" y1="1376" y2="1376" x1="1296" />
            <wire x2="1296" y1="1376" y2="1440" x1="1296" />
        </branch>
        <instance x="1296" y="1824" name="XLXI_10" orien="R0" />
        <branch name="XLXN_32">
            <wire x2="720" y1="1184" y2="1184" x1="672" />
            <wire x2="1312" y1="1184" y2="1184" x1="720" />
            <wire x2="1312" y1="1184" y2="1248" x1="1312" />
            <wire x2="720" y1="1184" y2="1568" x1="720" />
            <wire x2="1296" y1="1568" y2="1568" x1="720" />
        </branch>
        <branch name="D1">
            <wire x2="320" y1="1664" y2="1664" x1="176" />
            <wire x2="320" y1="1664" y2="1696" x1="320" />
            <wire x2="1296" y1="1696" y2="1696" x1="320" />
            <wire x2="320" y1="1440" y2="1664" x1="320" />
            <wire x2="448" y1="1440" y2="1440" x1="320" />
        </branch>
        <instance x="448" y="1472" name="XLXI_13" orien="R0" />
        <branch name="D0">
            <wire x2="1280" y1="1760" y2="1760" x1="176" />
            <wire x2="1296" y1="1760" y2="1760" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="176" y="1760" name="D0" orien="R180" />
        <branch name="g">
            <wire x2="1984" y1="1392" y2="1392" x1="1952" />
        </branch>
        <iomarker fontsize="28" x="1984" y="1392" name="g" orien="R0" />
    </sheet>
</drawing>