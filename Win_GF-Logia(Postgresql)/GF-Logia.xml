<?xml version="1.0" encoding="UTF-8"?>
<database>
    <name>Mech-Logia</name>
    <table>
        <database></database>
        <name>info</name>
        <ddl>CREATE TABLE info (test VARCHAR(255))</ddl>
        <columns>
            <column>
                <name>test</name>
                <type>VARCHAR</type>
            </column>
        </columns>
        <rows>
        </rows>
    </table>
    <table>
        <database></database>
        <name>Job</name>
        <ddl>CREATE TABLE Job (
        	ID INTEGER PRIMARY KEY AUTOINCREMENT,
        	Jobname TEXT,
        	jobinfo TEXT,
        	jobrepport TEXT
        , punchin TEXT, punchout TEXT, WO TEXT)</ddl>
        <columns>
            <column>
                <name>ID</name>
                <type>INTEGER</type>
                <constraints>
                    <constraint>
                        <type>PRIMARY KEY</type>
                        <definition>PRIMARY KEY AUTOINCREMENT</definition>
                    </constraint>
                </constraints>
            </column>
            <column>
                <name>Jobname</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>jobinfo</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>jobrepport</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>punchin</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>punchout</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>WO</name>
                <type>TEXT</type>
            </column>
        </columns>
        <rows>
            <row>
                <value column="0">7</value>
                <value column="1">job</value>
                <value column="2">maintenace</value>
                <value column="3" null="true"/>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
                <value column="6">WO No: 3</value>
            </row>
            <row>
                <value column="0">8</value>
                <value column="1">wo4 job test</value>
                <value column="2">test drive the truck #test</value>
                <value column="3" null="true"/>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
                <value column="6">WO No: 4</value>
            </row>
            <row>
                <value column="0">17</value>
                <value column="1">thistes2</value>
                <value column="2">fg</value>
                <value column="3">dfsdfsdf</value>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
                <value column="6">WO No: 2</value>
            </row>
            <row>
                <value column="0">18</value>
                <value column="1">ffffff</value>
                <value column="2">fffff</value>
                <value column="3">sdfsdfsdfsdfsdfsfsdfsdfsdfsdfsdf</value>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
                <value column="6">WO No: 2</value>
            </row>
        </rows>
    </table>
    <table>
        <database></database>
        <name>Note</name>
        <ddl>CREATE TABLE Note (
        	id INTEGER PRIMARY KEY AUTOINCREMENT,
        	Notename TEXT,
        	Wo INTEGER,
        	Content TEXT
        , serie TEXT)</ddl>
        <columns>
            <column>
                <name>id</name>
                <type>INTEGER</type>
                <constraints>
                    <constraint>
                        <type>PRIMARY KEY</type>
                        <definition>PRIMARY KEY AUTOINCREMENT</definition>
                    </constraint>
                </constraints>
            </column>
            <column>
                <name>Notename</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>Wo</name>
                <type>INTEGER</type>
            </column>
            <column>
                <name>Content</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>serie</name>
                <type>TEXT</type>
            </column>
        </columns>
        <rows>
            <row>
                <value column="0">56</value>
                <value column="1">wo4 test</value>
                <value column="2">WO No: 4</value>
                <value column="3">fxg</value>
                <value column="4">WO No: 4</value>
            </row>
            <row>
                <value column="0">57</value>
                <value column="1">fgfg</value>
                <value column="2">WO No: 1</value>
                <value column="3"></value>
                <value column="4">WO No: 1</value>
            </row>
            <row>
                <value column="0">58</value>
                <value column="1">dfgfdg</value>
                <value column="2">WO No: 2</value>
                <value column="3">fgfd</value>
                <value column="4">WO No: 2</value>
            </row>
            <row>
                <value column="0">59</value>
                <value column="1">testing12</value>
                <value column="2">WO No: 2</value>
                <value column="3">sdf</value>
                <value column="4">WO No: 2</value>
            </row>
        </rows>
    </table>
    <table>
        <database></database>
        <name>punch</name>
        <ddl><![CDATA[CREATE TABLE punch (
        	ID INTEGER PRIMARY KEY AUTOINCREMENT,
        	WO TEXT,
        	"USER" TEXT,
        	Punchin TEXT,
        	punchout TEXT
        , nomtravaux TEXT)]]></ddl>
        <columns>
            <column>
                <name>ID</name>
                <type>INTEGER</type>
                <constraints>
                    <constraint>
                        <type>PRIMARY KEY</type>
                        <definition>PRIMARY KEY AUTOINCREMENT</definition>
                    </constraint>
                </constraints>
            </column>
            <column>
                <name>WO</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>USER</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>Punchin</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>punchout</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>nomtravaux</name>
                <type>TEXT</type>
            </column>
        </columns>
        <rows>
            <row>
                <value column="0">8</value>
                <value column="1">WO No: 2</value>
                <value column="2">Mecanic</value>
                <value column="3">Thursday, 5-10-202311:12:34 and 841 millisconds</value>
                <value column="4">21/10/2023  02:37:47</value>
                <value column="5">maintenance</value>
            </row>
        </rows>
    </table>
    <table>
        <database></database>
        <name>User</name>
        <ddl><![CDATA[CREATE TABLE "User" (
        	id INTEGER PRIMARY KEY AUTOINCREMENT,
        	username TEXT,
        	Nom TEXT,
        	Prenom TEXT,
        	Address TEXT,
        	email TEXT,
        	telephone INTEGER,
        	age INTEGER,
        	Title TEXT,
        	Flag INTEGER
        )]]></ddl>
        <columns>
            <column>
                <name>id</name>
                <type>INTEGER</type>
                <constraints>
                    <constraint>
                        <type>PRIMARY KEY</type>
                        <definition>PRIMARY KEY AUTOINCREMENT</definition>
                    </constraint>
                </constraints>
            </column>
            <column>
                <name>username</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>Nom</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>Prenom</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>Address</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>email</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>telephone</name>
                <type>INTEGER</type>
            </column>
            <column>
                <name>age</name>
                <type>INTEGER</type>
            </column>
            <column>
                <name>Title</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>Flag</name>
                <type>INTEGER</type>
            </column>
        </columns>
        <rows>
            <row>
                <value column="0">4</value>
                <value column="1">Mecanic</value>
                <value column="2" null="true"/>
                <value column="3" null="true"/>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
                <value column="6" null="true"/>
                <value column="7" null="true"/>
                <value column="8" null="true"/>
                <value column="9" null="true"/>
            </row>
        </rows>
    </table>
    <table>
        <database></database>
        <name>Workorder</name>
        <ddl>CREATE TABLE Workorder (
        	ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
        , JobAtext TEXT, JobAstring TEXT, WO INTEGER, punchin TEXT, punchout TEXT)</ddl>
        <columns>
            <column>
                <name>ID</name>
                <type>INTEGER</type>
                <constraints>
                    <constraint>
                        <type>PRIMARY KEY</type>
                        <definition>PRIMARY KEY AUTOINCREMENT </definition>
                    </constraint>
                    <constraint>
                        <type>NOT NULL</type>
                        <definition>NOT NULL
                        </definition>
                    </constraint>
                </constraints>
            </column>
            <column>
                <name>JobAtext</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>JobAstring</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>WO</name>
                <type>INTEGER</type>
            </column>
            <column>
                <name>punchin</name>
                <type>TEXT</type>
            </column>
            <column>
                <name>punchout</name>
                <type>TEXT</type>
            </column>
        </columns>
        <rows>
            <row>
                <value column="0">1</value>
                <value column="1">Make Inspection P.E.P</value>
                <value column="2">Inspection done (GF)</value>
                <value column="3">WO No: 2</value>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
            </row>
            <row>
                <value column="0">2</value>
                <value column="1" null="true"/>
                <value column="2" null="true"/>
                <value column="3" null="true"/>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
            </row>
            <row>
                <value column="0">3</value>
                <value column="1" null="true"/>
                <value column="2" null="true"/>
                <value column="3" null="true"/>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
            </row>
            <row>
                <value column="0">4</value>
                <value column="1" null="true"/>
                <value column="2" null="true"/>
                <value column="3" null="true"/>
                <value column="4" null="true"/>
                <value column="5" null="true"/>
            </row>
        </rows>
    </table>
    <index>
        <database></database>
        <name>Workorder_ID_IDX</name>
        <ddl>CREATE INDEX Workorder_ID_IDX ON Workorder (ID DESC)</ddl>
    </index>
</database>
