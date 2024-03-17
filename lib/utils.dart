String removeMarkupTags(String htmlContent) {
  var markupRemoved =
      htmlContent.replaceAll(RegExp(r'<[^>]*>|&[^;]+;|\d+'), '');

  return markupRemoved;
}
