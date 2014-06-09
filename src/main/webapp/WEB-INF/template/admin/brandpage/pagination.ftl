[#if totalPages > 1]
	<div class="pagination">
		[#if isFirst]
			<span class="firstPage">&nbsp;</span>
		[#else]
			<a class="firstPage " href="?category=a-${a}-b-${b}-c-${firstPageNumber}">&nbsp;</a>
		[/#if]
		[#if hasPrevious]
			<a class="previousPage " href="?category=a-${a}-b-${b}-c-${previousPageNumber}">&nbsp;</a>
		[#else]
			<span class="previousPage">&nbsp;</span>
		[/#if]
		[#list segment as segmentPageNumber]
			[#if segmentPageNumber_index == 0 && segmentPageNumber > firstPageNumber + 1]
				<span class="pageBreak">...</span>
			[/#if]
			[#if segmentPageNumber != pageNumber]
				<a href="?category=a-${a}-b-${b}-c-${segmentPageNumber}">${segmentPageNumber}</a>
			[#else]
				<span class="currentPage">${segmentPageNumber}</span>
			[/#if]
			[#if !segmentPageNumber_has_next && segmentPageNumber < lastPageNumber - 1]
				<span class="pageBreak">...</span>
			[/#if]
		[/#list]
		[#if hasNext]
			<a class="nextPage " href="?category=a-${a}-b-${b}-c-${nextPageNumber}">&nbsp;</a>
		[#else]
			<span class="nextPage">&nbsp;</span>
		[/#if]
		[#if isLast]
			<span class="lastPage">&nbsp;</span>
		[#else]
			
			<a class="lastPage " href="?category=a-${a}-b-${b}-c-${lastPageNumber}")?interpret /]">&nbsp;</a>
		[/#if]
	</div>
[/#if]