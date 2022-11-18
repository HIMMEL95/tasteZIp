<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">

<input type="hidden" name="iforSeq" value="<c:out value="${vo.iforSeq}"/>"/>
<input type="hidden" name="shOption" value="<c:out value="${vo.shOption}"/>"/>
<input type="hidden" name="shValue" value="<c:out value="${vo.shValue}"/>"/> 
<input type="hidden" name="ifcmDelNy" value="<c:out value="${vo.iforDelNy}"/>"/>
<input type="hidden" name="shUpdt" value="<c:out value="${vo.shUpdt}"/>"/>