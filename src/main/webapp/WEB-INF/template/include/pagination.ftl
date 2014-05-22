<input type="hidden" id="pageSize" name="pageSize" value="2" />
[#if totalPages > 1]
	<div class="pagination">
		[#if isFirst]
			<span class="firstPage">&nbsp;</span>
		[#else]
			<a class="firstPage" href="javascript: $.pageSkip(${firstPageNumber});">&nbsp;</a>
		[/#if]
		[#if hasPrevious]
			<a class="previousPage" href="javascript: $.pageSkip(${previousPageNumber});">&nbsp;</a>
		[#else]
			<span class="previousPage">&nbsp;</span>
		[/#if]
		[#list segment as segmentPageNumber]
			[#if segmentPageNumber_index == 0 && segmentPageNumber > firstPageNumber + 1]
				<span class="pageBreak">...</span>
			[/#if]
			[#if segmentPageNumber != pageNumber]
				<a href="javascript: $.pageSkip(${segmentPageNumber});">${segmentPageNumber}</a>
			[#else]
				<span class="currentPage">${segmentPageNumber}</span>
			[/#if]
			[#if !segmentPageNumber_has_next && segmentPageNumber < lastPageNumber - 1]
				<span class="pageBreak">...</span>
			[/#if]
		[/#list]
		[#if hasNext]
			<a class="nextPage" href="javascript: $.pageSkip(${nextPageNumber});">&nbsp;</a>
		[#else]
			<span class="nextPage">&nbsp;</span>
		[/#if]
		[#if isLast]
			<span class="lastPage">&nbsp;</span>
		[#else]
			<a class="lastPage" href="javascript: $.pageSkip(${lastPageNumber});">&nbsp;</a>
		[/#if]
		<span class="pageSkip">
			共${totalPages}页 到第<input onpaste="return false;" maxlength="9" value="${pageNumber}" name="pageNumber" id="pageNumber">页<button type="submit">确定</button>
		</span>
	</div>
[/#if]