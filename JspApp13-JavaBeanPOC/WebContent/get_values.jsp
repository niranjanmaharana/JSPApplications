<jsp:useBean id="stBean" class="com.jit.beans.StudentBeans" scope="session" />
Student No. : <jsp:getProperty property="sno" name="stBean"/><br>
Student Name : <jsp:getProperty property="sname" name="stBean"/><br>
Address : <jsp:getProperty property="sadd" name="stBean"/><br>