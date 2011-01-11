<%--
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/portlet/asset_category_admin/init.jsp" %>

<%
AssetVocabulary vocabulary = (AssetVocabulary)request.getAttribute(WebKeys.ASSET_VOCABULARY);
%>

<portlet:actionURL var="editVocabularyURL">
	<portlet:param name="struts_action" value="/asset_category_admin/edit_vocabulary" />
</portlet:actionURL>

<aui:form action='<%=editVocabularyURL%>' cssClass="update-vocabulary-form" method="get" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= vocabulary == null ? Constants.ADD : Constants.UPDATE %>" />
	<aui:input name="vocabularyId" type="hidden" value="<%= vocabulary != null ? vocabulary.getVocabularyId() : StringPool.BLANK %>" />

	<aui:model-context bean="<%= vocabulary %>" model="<%= AssetVocabulary.class %>" />

	<aui:fieldset>
		<div>
			<div class="add-vocabulary-layer asset-category-layer">
				<aui:input label="name" name="title" cssClass="vocabulary-name" />

				<aui:input name="description" />

				<c:choose>
					<c:when test="<%= vocabulary == null %>">
						<aui:field-wrapper cssClass="vocabulary-permissions-actions" label="permissions">
							<liferay-ui:input-permissions
							modelName="<%= AssetVocabulary.class.getName() %>"
								/>
						</aui:field-wrapper>
					</c:when>
				</c:choose>

				<aui:button-row>
					<aui:button type="submit"/>

					<c:if test="<%= vocabulary != null && permissionChecker.hasPermission(scopeGroupId, AssetVocabulary.class.getName(), vocabulary.getVocabularyId(), ActionKeys.DELETE) %>" >
						<aui:button value="delete" cssClass="vocabulary-delete-button" />
					</c:if>

					<c:if test="<%= vocabulary != null && permissionChecker.hasPermission(scopeGroupId, AssetVocabulary.class.getName(), vocabulary.getVocabularyId(), ActionKeys.PERMISSIONS) %>" >
						<liferay-security:permissionsURL
							modelResource="<%= AssetVocabulary.class.getName() %>"
							modelResourceDescription="<%= vocabulary.getTitle(locale) %>"
							resourcePrimKey="<%= String.valueOf(vocabulary.getVocabularyId()) %>"
							var="permissionsURL"
						/>

						<aui:button value="permissions" onClick="<%= permissionsURL %>" />
					</c:if>

					<aui:button cssClass="close-panel" type="cancel" value="close" />
				</aui:button-row>
			</div>
		</div>
	</aui:fieldset>
</aui:form>