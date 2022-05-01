// To parse this JSON data, do
//
//     final getMovie = getMovieFromJson(jsonString);

import 'dart:convert';

GetMovie getMovieFromJson(String str) => GetMovie.fromJson(json.decode(str));

String getMovieToJson(GetMovie data) => json.encode(data.toJson());

class GetMovie {
  GetMovie({
    // required this.searchMetadata,
    // required this.searchParameters,
    // required this.searchInformation,
    // required this.imageSizes,
    // required this.inlineImages,
    // required this.inlineImagesLink,
    // required this.inlineImagesSerpapiLink,
    this.imageResults,
  });

  // SearchMetadata searchMetadata;
  // SearchParameters searchParameters;
  // SearchInformation searchInformation;
  // List<ImageSize> imageSizes;
  // List<InlineImage> inlineImages;
  // String inlineImagesLink;
  // String inlineImagesSerpapiLink;
  List<ImageResult>? imageResults;

  factory GetMovie.fromJson(Map<String, dynamic> json) => GetMovie(
    // searchMetadata: SearchMetadata.fromJson(json["search_metadata"]),
    // searchParameters: SearchParameters.fromJson(json["search_parameters"]),
    // searchInformation: SearchInformation.fromJson(json["search_information"]),
    // imageSizes: List<ImageSize>.from(json["image_sizes"].map((x) => ImageSize.fromJson(x))),
    // inlineImages: List<InlineImage>.from(json["inline_images"].map((x) => InlineImage.fromJson(x))),
    // inlineImagesLink: json["inline_images_link"],
    // inlineImagesSerpapiLink: json["inline_images_serpapi_link"],
    imageResults: List<ImageResult>.from(json["image_results"].map((x) => ImageResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    // "search_metadata": searchMetadata.toJson(),
    // "search_parameters": searchParameters.toJson(),
    // "search_information": searchInformation.toJson(),
    // "image_sizes": List<dynamic>.from(imageSizes.map((x) => x.toJson())),
    // "inline_images": List<dynamic>.from(inlineImages.map((x) => x.toJson())),
    // "inline_images_link": inlineImagesLink,
    // "inline_images_serpapi_link": inlineImagesSerpapiLink,
    "image_results": List<dynamic>.from(imageResults!.map((x) => x.toJson())),
  };
}

class ImageResult {
  ImageResult({
    // this.position,
    this.title,
    this.link,
    this.displayedLink,
    this.snippet,
    this.snippetHighlightedWords,
    // required this.cachedPageLink,
    this.thumbnail,
    // required this.richSnippet,
    // required this.imageResolution,
    // required this.relatedPagesLink,
  });

  // int? position;
  String? title;
  String? link;
  String? displayedLink;
  String? snippet;
  List<String>? snippetHighlightedWords;
  // String cachedPageLink;
  String? thumbnail;
  // RichSnippet richSnippet;
  // String imageResolution;
  // String relatedPagesLink;

  factory ImageResult.fromJson(Map<String, dynamic> json) => ImageResult(
    // position: json["position"],
    title: json["title"],
    link: json["link"],
    displayedLink: json["displayed_link"],
    snippet: json["snippet"],
    snippetHighlightedWords: json["snippet_highlighted_words"] != null ? List<String>.from(json["snippet_highlighted_words"].map((x) => x)): null,
    // cachedPageLink: json["cached_page_link"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    // richSnippet: json["rich_snippet"] == null ? null : (json["rich_snippet"]),
    // imageResolution: json["image_resolution"] == null ? null : json["image_resolution"],
    // relatedPagesLink: json["related_pages_link"] == null ? null : json["related_pages_link"],
  );

  Map<String, dynamic> toJson() => {
    // "position": position,
    "title": title,
    "link": link,
    "displayed_link": displayedLink,
    "snippet": snippet,
    "snippet_highlighted_words": List<dynamic>.from(snippetHighlightedWords!.map((x) => x)),
    // "cached_page_link": cachedPageLink,
    "thumbnail": thumbnail == null ? null : thumbnail,
    // "rich_snippet": richSnippet == null ? null : richSnippet.toJson(),
    // "image_resolution": imageResolution == null ? null : imageResolution,
    // "related_pages_link": relatedPagesLink == null ? null : relatedPagesLink,
  };
}

class RichSnippet {
  RichSnippet({
    required this.top,
  });

  Top top;

  factory RichSnippet.fromJson(Map<String, dynamic> json) => RichSnippet(
    top: Top.fromJson(json["top"]),
  );

  Map<String, dynamic> toJson() => {
    "top": top.toJson(),
  };
}

class Top {
  Top({
    required this.detectedExtensions,
    required this.extensions,
  });

  DetectedExtensions detectedExtensions;
  List<String> extensions;

  factory Top.fromJson(Map<String, dynamic> json) => Top(
    detectedExtensions: DetectedExtensions.fromJson(json["detected_extensions"]),
    extensions: List<String>.from(json["extensions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "detected_extensions": detectedExtensions.toJson(),
    "extensions": List<dynamic>.from(extensions.map((x) => x)),
  };
}

class DetectedExtensions {
  DetectedExtensions({
    required this.empty,
    this.jun,
    this.may,
  });

  int empty;
  dynamic jun;
  dynamic may;

  factory DetectedExtensions.fromJson(Map<String, dynamic> json) => DetectedExtensions(
    empty: json["×"],
    jun: json["jun"],
    may: json["may"],
  );

  Map<String, dynamic> toJson() => {
    "×": empty,
    "jun": jun,
    "may": may,
  };
}

class ImageSize {
  ImageSize({
    required this.title,
    required this.link,
    required this.serpapiLink,
  });

  String title;
  String link;
  String serpapiLink;

  factory ImageSize.fromJson(Map<String, dynamic> json) => ImageSize(
    title: json["title"],
    link: json["link"],
    serpapiLink: json["serpapi_link"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
    "serpapi_link": serpapiLink,
  };
}

class InlineImage {
  InlineImage({
    required this.link,
    required this.source,
    required this.thumbnail,
  });

  String link;
  String source;
  String thumbnail;

  factory InlineImage.fromJson(Map<String, dynamic> json) => InlineImage(
    link: json["link"],
    source: json["source"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
    "source": source,
    "thumbnail": thumbnail,
  };
}

class SearchInformation {
  SearchInformation({
    required this.organicResultsState,
    required this.queryDisplayed,
    required this.totalResults,
    required this.timeTakenDisplayed,
  });

  String organicResultsState;
  String queryDisplayed;
  int totalResults;
  double timeTakenDisplayed;

  factory SearchInformation.fromJson(Map<String, dynamic> json) => SearchInformation(
    organicResultsState: json["organic_results_state"],
    queryDisplayed: json["query_displayed"],
    totalResults: json["total_results"],
    timeTakenDisplayed: json["time_taken_displayed"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "organic_results_state": organicResultsState,
    "query_displayed": queryDisplayed,
    "total_results": totalResults,
    "time_taken_displayed": timeTakenDisplayed,
  };
}

class SearchMetadata {
  SearchMetadata({
    required this.id,
    required this.status,
    required this.jsonEndpoint,
    required this.createdAt,
    required this.processedAt,
    required this.googleReverseImageUrl,
    required this.rawHtmlFile,
    required this.totalTimeTaken,
  });

  String id;
  String status;
  String jsonEndpoint;
  String createdAt;
  String processedAt;
  String googleReverseImageUrl;
  String rawHtmlFile;
  double totalTimeTaken;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) => SearchMetadata(
    id: json["id"],
    status: json["status"],
    jsonEndpoint: json["json_endpoint"],
    createdAt: json["created_at"],
    processedAt: json["processed_at"],
    googleReverseImageUrl: json["google_reverse_image_url"],
    rawHtmlFile: json["raw_html_file"],
    totalTimeTaken: json["total_time_taken"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "json_endpoint": jsonEndpoint,
    "created_at": createdAt,
    "processed_at": processedAt,
    "google_reverse_image_url": googleReverseImageUrl,
    "raw_html_file": rawHtmlFile,
    "total_time_taken": totalTimeTaken,
  };
}

class SearchParameters {
  SearchParameters({
    required this.engine,
    required this.imageUrl,
    required this.googleDomain,
    required this.device,
  });

  String engine;
  String imageUrl;
  String googleDomain;
  String device;

  factory SearchParameters.fromJson(Map<String, dynamic> json) => SearchParameters(
    engine: json["engine"],
    imageUrl: json["image_url"],
    googleDomain: json["google_domain"],
    device: json["device"],
  );

  Map<String, dynamic> toJson() => {
    "engine": engine,
    "image_url": imageUrl,
    "google_domain": googleDomain,
    "device": device,
  };
}
