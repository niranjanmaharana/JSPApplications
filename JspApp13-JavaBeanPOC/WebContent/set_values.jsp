<jsp:useBean id="stBean" class="com.jit.beans.StudentBeans" scope="session" />

<!--
<jsp:setProperty name="stBean" property="sno" value="101"/>
<jsp:setProperty name="stBean" property="sname" value="Niranjan"/>
<jsp:setProperty name="stBean" property="sadd" value="Barapalli"/>
-->

<jsp:setProperty name="stBean" property="sno" param="tsno"/>
<jsp:setProperty name="stBean" property="sname" param="tsname"/>
<jsp:setProperty name="stBean" property="sadd" param="tsadd"/>

Values are set<br>