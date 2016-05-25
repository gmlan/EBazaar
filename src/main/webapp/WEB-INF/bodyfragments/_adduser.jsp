<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<h1>Add User!!!</h1>
<hr> 
<h2>test :${test}</h2>
<section class="container"> 
    <form:form id="test" action="admin/add" modelAttribute="newUser" class="form-horizontal">
        <form:errors path="*" cssClass="alert alert-danger" element="div"/>
        <fieldset>
            <legend>Add new user</legend>

            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2" for="userName">User Name</label>
                <div class="col-lg-10">
                    <form:input id="userName" path="userName" type="text" class="form:input-large" />
                    <form:errors path="userName" cssClass="text-danger"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2" for="password">Password</label>
                <div class="col-lg-10">
                    <form:input id="password" path="password" type="password" class="form:input-large" />
                    <form:errors path="password" cssClass="text-danger"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2" for="password">Reenter Password</label>
                <div class="col-lg-10">
                    <input id="password"  type="password" class="form:input-large" />
                    <form:errors path="password" cssClass="text-danger"/>
                </div>
            </div> 

            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2" for="firstName">First Name</label>
                <div class="col-lg-10">
                    <form:input id="firstName" path="firstName" type="text"	class="form:input-large" />
                    <form:errors path="firstName" cssClass="text-danger"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2" for="lastName">Last Name</label>
                <div class="col-lg-10">
                    <form:input id="lastName" path="lastName" type="text"	class="form:input-large" />
                    <form:errors path="lastName" cssClass="text-danger"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2" for="email">Email</label>
                <div class="col-lg-10">
                    <form:input id="email" path="email" type="text"	class="form:input-large" />
                    <form:errors path="email" cssClass="text-danger"/>
                </div>
            </div>


            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2" for="address">Address</label>
                <div class="col-lg-10">
                    <form:input id="address" path="address" type="text" class="form:input-large" />
                    <form:errors path="address" cssClass="text-danger"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2 col-lg-2" for="phone">Phone</label>
                <div class="col-lg-10">
                    <form:input id="phone" path="phone" type="text" class="form:input-large" />
                    <form:errors path="phone" cssClass="text-danger"/>
                </div>
            </div>
                               
            <div class="form-group">
                <label class="control-label col-lg-2" for="condition">Enabled</label>
                <div class="col-lg-10">                    
                    <form:checkbox path="enabled" />               
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="condition">User Type</label>
                <div class="col-lg-10">                    
                    <form:radiobutton path="type"  value="Administrator" /> Administrator<br>
                    <form:radiobutton path="type"  value="Librarian" /> Librarian<br>                     
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" id="btnAdd" class="btn btn-primary" value="Add" />
                </div>
            </div>
        </fieldset>
    </form:form> 
</section>

</form>