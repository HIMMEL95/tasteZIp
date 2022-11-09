<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<input type="hidden" name="thisPage2" value="<c:out value="${vo.thisPage}" default="1"/>">
<input type="hidden" name="rowNumToShow2" value="<c:out value="${vo.rowNumToShow}"/>">

<input type="hidden" name="ifmnSeq" value="<c:out value="${vo.ifmnSeq}"/>"/>

<i<input type="hidden" name="shDelNy" value="<c:out value="${vo.shDelNy}"/>"/>
<input type="hidden" name="shDate" value="<c:out value="${vo.shDate}"/>"/>

<input type="hidden" name="startDate" value="<c:out value="${vo.shDateStart}"/>"/>
<input type="hidden" name="endDate" value="<c:out value="${vo.shDateEnd}"/>"/>

<input type="hidden" name="shOption" value="<c:out value="${vo.shOption}"/>"/>
<input type="hidden" name="shValue" value="<c:out value="${vo.shValue}"/>"/>