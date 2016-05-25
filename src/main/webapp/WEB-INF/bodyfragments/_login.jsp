<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h1>Login</h1>
<hr>
<br/> 
<div class="col-md-4 col-md-offset-4">
            <div class="panel-heading">
                <h3 class="panel-title">Please sign in</h3>
            </div>
            <div class="panel-body">
                <form:form modelAttribute="user" action="${pageContext.request.contextPath}/login" method="post">
                    <form:errors path="*" cssClass="alert alert-danger" element="div"/>
                    <fieldset>
                        <div class='form-group'>
                            <form:input class="form-control" placeholder="User Name" path='userName' type="text" />
                        </div>
                        <div class="form-group">
                            <form:input class='form-control' placeholder="Password"	path='password' type="password" />
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label> <form:checkbox path="rememberme" />Remember Me
                                </label>
                            </div>
                        </div>
                        <input class="btn btn-lg btn-success btn-block" type="submit"	value="login">
                    </fieldset>
                </form:form>
            </div>
        </div>
 