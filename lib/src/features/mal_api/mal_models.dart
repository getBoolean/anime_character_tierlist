import 'package:dart_mappable/dart_mappable.dart';

part 'mal_models.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalPage<T> with MalPageMappable {
  final List<T> data;
  final MalPaging paging;

  const MalPage({required this.data, required this.paging});

  factory MalPage.fromJson(String json) => MalPageMapper.fromJson(json);
  factory MalPage.fromMap(Map<String, dynamic> map) =>
      MalPageMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalSeasonalAnimePage extends MalPage<MalAnime>
    with MalSeasonalAnimePageMappable {
  final MalAnimeSeason season;

  const MalSeasonalAnimePage({
    required super.data,
    required super.paging,
    required this.season,
  });

  factory MalSeasonalAnimePage.fromJson(String json) =>
      MalSeasonalAnimePageMapper.fromJson(json);
  factory MalSeasonalAnimePage.fromMap(Map<String, dynamic> map) =>
      MalSeasonalAnimePageMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalPaging with MalPagingMappable {
  final String? next;

  const MalPaging({required this.next});

  factory MalPaging.fromJson(String json) => MalPagingMapper.fromJson(json);
  factory MalPaging.fromMap(Map<String, dynamic> map) =>
      MalPagingMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnime with MalAnimeMappable {
  final MalEntryNode node;

  const MalAnime({required this.node});

  factory MalAnime.fromJson(String json) => MalAnimeMapper.fromJson(json);
  factory MalAnime.fromMap(Map<String, dynamic> map) =>
      MalAnimeMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalUserAnime extends MalAnime with MalUserAnimeMappable {
  final MalListStatus listStatus;

  const MalUserAnime({required super.node, required this.listStatus});

  factory MalUserAnime.fromJson(String json) =>
      MalUserAnimeMapper.fromJson(json);
  factory MalUserAnime.fromMap(Map<String, dynamic> map) =>
      MalUserAnimeMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalEntryNode with MalEntryNodeMappable {
  final int id;
  final String title;
  final MalPicture mainPicture;

  const MalEntryNode({
    required this.id,
    required this.title,
    required this.mainPicture,
  });

  factory MalEntryNode.fromJson(String json) =>
      MalEntryNodeMapper.fromJson(json);
  factory MalEntryNode.fromMap(Map<String, dynamic> map) =>
      MalEntryNodeMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
abstract class MalEntryDetails extends MalEntryNode
    with MalEntryDetailsMappable {
  final MalAlternativeTitles alternativeTitles;
  final DateTime startDate;
  final DateTime endDate;
  final String synopsis;
  final double mean;
  final int rank;
  final int popularity;
  final int numListUsers;
  final int numScoringUsers;
  final String nsfw;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String mediaType;
  final String status;
  final List<MalGenre> genres;
  final MalListStatus myListStatus;
  final List<MalPicture> pictures;
  final String background;
  final List<MalAnimeRelated> relatedAnime;
  final List<MalMangaDetailsRelated> relatedManga;
  final List<MalAnimeRecommendation> recommendations;
  final List<MalStudio> studios;
  final MalAnimeStatistics statistics;

  const MalEntryDetails({
    required super.id,
    required super.title,
    required super.mainPicture,
    required this.alternativeTitles,
    required this.startDate,
    required this.endDate,
    required this.synopsis,
    required this.mean,
    required this.rank,
    required this.popularity,
    required this.numListUsers,
    required this.numScoringUsers,
    required this.nsfw,
    required this.createdAt,
    required this.updatedAt,
    required this.mediaType,
    required this.status,
    required this.genres,
    required this.myListStatus,
    required this.pictures,
    required this.background,
    required this.relatedAnime,
    required this.relatedManga,
    required this.recommendations,
    required this.studios,
    required this.statistics,
  });

  factory MalEntryDetails.fromJson(String json) =>
      MalEntryDetailsMapper.fromJson(json);
  factory MalEntryDetails.fromMap(Map<String, dynamic> map) =>
      MalEntryDetailsMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnimeDetails extends MalEntryDetails with MalAnimeDetailsMappable {
  final int numEpisodes;
  final MalAnimeSeason startSeason;
  final MalAnimeBroadcast broadcast;
  final String source;
  final int averageEpisodeDuration;
  final String rating;

  const MalAnimeDetails({
    required super.id,
    required super.title,
    required super.mainPicture,
    required super.alternativeTitles,
    required super.startDate,
    required super.endDate,
    required super.synopsis,
    required super.mean,
    required super.rank,
    required super.popularity,
    required super.numListUsers,
    required super.numScoringUsers,
    required super.nsfw,
    required super.createdAt,
    required super.updatedAt,
    required super.mediaType,
    required super.status,
    required super.genres,
    required super.myListStatus,
    required super.pictures,
    required super.background,
    required super.relatedAnime,
    required super.relatedManga,
    required super.recommendations,
    required super.studios,
    required super.statistics,
    required this.numEpisodes,
    required this.startSeason,
    required this.broadcast,
    required this.source,
    required this.averageEpisodeDuration,
    required this.rating,
  });

  factory MalAnimeDetails.fromJson(String json) =>
      MalAnimeDetailsMapper.fromJson(json);
  factory MalAnimeDetails.fromMap(Map<String, dynamic> map) =>
      MalAnimeDetailsMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalMangaDetails extends MalEntryDetails with MalMangaDetailsMappable {
  final int numVolumes;
  final int numChapters;
  final List<MalAuthor> authors;
  final List<MalSerialization> serializations;

  const MalMangaDetails({
    required super.id,
    required super.title,
    required super.mainPicture,
    required super.alternativeTitles,
    required super.startDate,
    required super.endDate,
    required super.synopsis,
    required super.mean,
    required super.rank,
    required super.popularity,
    required super.numListUsers,
    required super.numScoringUsers,
    required super.nsfw,
    required super.createdAt,
    required super.updatedAt,
    required super.mediaType,
    required super.status,
    required super.genres,
    required super.myListStatus,
    required super.pictures,
    required super.background,
    required super.relatedAnime,
    required super.relatedManga,
    required super.recommendations,
    required super.studios,
    required super.statistics,
    required this.numVolumes,
    required this.numChapters,
    required this.authors,
    required this.serializations,
  });

  factory MalMangaDetails.fromJson(String json) =>
      MalMangaDetailsMapper.fromJson(json);
  factory MalMangaDetails.fromMap(Map<String, dynamic> map) =>
      MalMangaDetailsMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAuthor with MalAuthorMappable {
  final int id;
  final String firstName;
  final String lastName;

  const MalAuthor({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory MalAuthor.fromJson(String json) => MalAuthorMapper.fromJson(json);
  factory MalAuthor.fromMap(Map<String, dynamic> map) =>
      MalAuthorMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAlternativeTitles with MalAlternativeTitlesMappable {
  final List<String> synonyms;
  final String en;
  final String ja;

  const MalAlternativeTitles({
    required this.synonyms,
    required this.en,
    required this.ja,
  });

  factory MalAlternativeTitles.fromJson(String json) =>
      MalAlternativeTitlesMapper.fromJson(json);
  factory MalAlternativeTitles.fromMap(Map<String, dynamic> map) =>
      MalAlternativeTitlesMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalGenre with MalGenreMappable {
  final int id;
  final String name;

  const MalGenre({required this.id, required this.name});

  factory MalGenre.fromJson(String json) => MalGenreMapper.fromJson(json);
  factory MalGenre.fromMap(Map<String, dynamic> map) =>
      MalGenreMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnimeSeason with MalAnimeSeasonMappable {
  final int year;
  final String season;

  const MalAnimeSeason({required this.year, required this.season});

  factory MalAnimeSeason.fromJson(String json) =>
      MalAnimeSeasonMapper.fromJson(json);
  factory MalAnimeSeason.fromMap(Map<String, dynamic> map) =>
      MalAnimeSeasonMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnimeBroadcast with MalAnimeBroadcastMappable {
  final String dayOfTheWeek;
  final String startTime;

  const MalAnimeBroadcast({
    required this.dayOfTheWeek,
    required this.startTime,
  });

  factory MalAnimeBroadcast.fromJson(String json) =>
      MalAnimeBroadcastMapper.fromJson(json);
  factory MalAnimeBroadcast.fromMap(Map<String, dynamic> map) =>
      MalAnimeBroadcastMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnimeRelated with MalAnimeRelatedMappable {
  final String relationType;
  final String relationTypeFormatted;
  final MalEntryNode node;

  const MalAnimeRelated({
    required this.relationType,
    required this.relationTypeFormatted,
    required this.node,
  });

  factory MalAnimeRelated.fromJson(String json) =>
      MalAnimeRelatedMapper.fromJson(json);
  factory MalAnimeRelated.fromMap(Map<String, dynamic> map) =>
      MalAnimeRelatedMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalMangaDetailsRelated with MalMangaDetailsRelatedMappable {
  final String relationType;
  final String relationTypeFormatted;

  // TODO: Implement for manga
  // final MalMangaDetailsNode node;

  const MalMangaDetailsRelated({
    required this.relationType,
    required this.relationTypeFormatted,
    // required this.node,
  });

  factory MalMangaDetailsRelated.fromJson(String json) =>
      MalMangaDetailsRelatedMapper.fromJson(json);
  factory MalMangaDetailsRelated.fromMap(Map<String, dynamic> map) =>
      MalMangaDetailsRelatedMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnimeRecommendation with MalAnimeRecommendationMappable {
  final MalEntryNode node;
  final int numRecommendations;

  const MalAnimeRecommendation({
    required this.node,
    required this.numRecommendations,
  });

  factory MalAnimeRecommendation.fromJson(String json) =>
      MalAnimeRecommendationMapper.fromJson(json);
  factory MalAnimeRecommendation.fromMap(Map<String, dynamic> map) =>
      MalAnimeRecommendationMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalEntryRanking with MalEntryRankingMappable {
  final MalEntryNode node;
  final MalEntryRankingItem rank;

  const MalEntryRanking({required this.node, required this.rank});

  factory MalEntryRanking.fromJson(String json) =>
      MalEntryRankingMapper.fromJson(json);
  factory MalEntryRanking.fromMap(Map<String, dynamic> map) =>
      MalEntryRankingMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalEntryRankingItem with MalEntryRankingItemMappable {
  final int rank;

  const MalEntryRankingItem({required this.rank});

  factory MalEntryRankingItem.fromJson(String json) =>
      MalEntryRankingItemMapper.fromJson(json);
  factory MalEntryRankingItem.fromMap(Map<String, dynamic> map) =>
      MalEntryRankingItemMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalStudio with MalStudioMappable {
  final int id;
  final String name;

  const MalStudio({required this.id, required this.name});

  factory MalStudio.fromJson(String json) => MalStudioMapper.fromJson(json);
  factory MalStudio.fromMap(Map<String, dynamic> map) =>
      MalStudioMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalSerialization with MalSerializationMappable {
  final MalSerializationNode node;

  const MalSerialization({required this.node});

  factory MalSerialization.fromJson(String json) =>
      MalSerializationMapper.fromJson(json);
  factory MalSerialization.fromMap(Map<String, dynamic> map) =>
      MalSerializationMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalSerializationNode with MalSerializationNodeMappable {
  final int id;
  final String name;

  const MalSerializationNode({required this.id, required this.name});

  factory MalSerializationNode.fromJson(String json) =>
      MalSerializationNodeMapper.fromJson(json);
  factory MalSerializationNode.fromMap(Map<String, dynamic> map) =>
      MalSerializationNodeMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnimeStatistics with MalAnimeStatisticsMappable {
  final MalAnimeStatisticsStatus status;
  final int numListUsers;

  const MalAnimeStatistics({required this.status, required this.numListUsers});

  factory MalAnimeStatistics.fromJson(String json) =>
      MalAnimeStatisticsMapper.fromJson(json);
  factory MalAnimeStatistics.fromMap(Map<String, dynamic> map) =>
      MalAnimeStatisticsMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnimeStatisticsStatus with MalAnimeStatisticsStatusMappable {
  final int watching;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToWatch;

  const MalAnimeStatisticsStatus({
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
  });

  factory MalAnimeStatisticsStatus.fromJson(String json) =>
      MalAnimeStatisticsStatusMapper.fromJson(json);
  factory MalAnimeStatisticsStatus.fromMap(Map<String, dynamic> map) =>
      MalAnimeStatisticsStatusMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalPicture with MalPictureMappable {
  final String medium;
  final String large;

  const MalPicture({required this.medium, required this.large});

  factory MalPicture.fromJson(String json) => MalPictureMapper.fromJson(json);

  factory MalPicture.fromMap(Map<String, dynamic> map) =>
      MalPictureMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalListStatus with MalListStatusMappable {
  final String status;
  final int score;
  final DateTime updatedAt;

  const MalListStatus({
    required this.status,
    required this.score,
    required this.updatedAt,
  });

  factory MalListStatus.fromJson(String json) =>
      MalListStatusMapper.fromJson(json);
  factory MalListStatus.fromMap(Map<String, dynamic> map) =>
      MalListStatusMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalAnimeListStatus extends MalListStatus with MalAnimeListStatusMappable {
  final int numEpisodesWatched;
  final bool isRewatching;

  const MalAnimeListStatus({
    required super.status,
    required super.score,
    required super.updatedAt,
    required this.numEpisodesWatched,
    required this.isRewatching,
  });

  factory MalAnimeListStatus.fromJson(String json) =>
      MalAnimeListStatusMapper.fromJson(json);
  factory MalAnimeListStatus.fromMap(Map<String, dynamic> map) =>
      MalAnimeListStatusMapper.fromMap(map);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MalMangaDetailsListStatus extends MalListStatus
    with MalMangaDetailsListStatusMappable {
  final bool isRereading;
  final int numVolumesRead;
  final int numChaptersRead;

  const MalMangaDetailsListStatus({
    required super.status,
    required super.score,
    required super.updatedAt,
    required this.isRereading,
    required this.numVolumesRead,
    required this.numChaptersRead,
  });

  factory MalMangaDetailsListStatus.fromJson(String json) =>
      MalMangaDetailsListStatusMapper.fromJson(json);
  factory MalMangaDetailsListStatus.fromMap(Map<String, dynamic> map) =>
      MalMangaDetailsListStatusMapper.fromMap(map);
}
