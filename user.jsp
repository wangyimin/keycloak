<%@ page import="org.keycloak.KeycloakSecurityContext" %>
<%@ page import="org.keycloak.representations.IDToken" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
    KeycloakSecurityContext ksc = (KeycloakSecurityContext)session.getAttribute(KeycloakSecurityContext.class.getName());
    IDToken idToken = ksc.getIdToken();
    Map<String, Object> attrs = idToken.getOtherClaims();
    request.setAttribute("attrs", attrs);
/*    
    final Principal userPrincipal = httpRequest.getUserPrincipal();
    if (userPrincipal instanceof KeycloakPrincipal) {
        KeycloakPrincipal<KeycloakSecurityContext> kp = (KeycloakPrincipal<KeycloakSecurityContext>) userPrincipal;
        IDToken token = kp.getKeycloakSecurityContext().getIdToken();

        Map<String, Object> otherClaims = token.getOtherClaims();
        if (otherClaims.containsKey("YOUR_CLAIM_KEY")) {
            yourClaim = String.valueOf(otherClaims.get("YOUR_CLAIM_KEY"));
        }
    } else {
        throw new RuntimeException(...);
    }
*/
%>

Id : <%=idToken.getPreferredUsername()%><br>
email: <%=idToken.getEmail() %><br>
firstname: <%=idToken.getGivenName()%><br>
lastname: <%=idToken.getFamilyName()%><br>
token: <%=ksc.getIdTokenString()%><br>
<c:forEach var="attr" items="${attrs}">
${attr.key}: ${attr.value}<br>
</c:forEach>
