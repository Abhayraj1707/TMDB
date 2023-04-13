//
//  Constants.m
//  TMDB
//
//  Created by Abhay Raj on 13/04/23.
//

#import "Constants.h"

@implementation Constants

NSString * const searchViewIdentifier = @"SearchViewController";
NSString * const profileViewIdentifier = @"ProfileViewController";
NSString * const genreCellIdentifier = @"genreCell";
NSString * const horizontalCellIdentifier = @"horizontalCell";
NSString * const profileImage = @"Profile_image.png";
NSString * const NeatFlixNameImg = @"neatflix_name.png";
NSString * const genreApi = @"https://api.themoviedb.org/3/genre/movie/list?api_key=626c45c82d5332598efa800848ea3571&language=en-US";
NSString * const popularApi = @"https://api.themoviedb.org/3/movie/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1";
NSString * const popularTvApi = @"https://api.themoviedb.org/3/tv/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1";
NSString * const topRatedApi = @"https://api.themoviedb.org/3/movie/top_rated?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1";
NSString * const trendingApi = @"https://api.themoviedb.org/3/trending/movie/day?api_key=626c45c82d5332598efa800848ea3571";
NSString * const trendingTvApi = @"https://api.themoviedb.org/3/trending/tv/day?api_key=626c45c82d5332598efa800848ea3571";
NSString * const upcomingApi = @"https://api.themoviedb.org/3/movie/upcoming?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1";
NSString * const recommendationApi = @"https://api.themoviedb.org/3/movie/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1";
NSString * const searchApi = @"https://api.themoviedb.org/3/search/movie?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1&include_adult=false&query=";
NSString * const recommendationsText = @"Recommendations";
NSString * const trendingText = @"Trending";
NSString * const topRatedText = @"Top Rated";
NSString * const upcomingText = @"Upcoming";
NSString * const popularText = @"Popular";
NSString * const recommendationCell = @"recommendations";
NSString * const trendingCell = @"trending";
NSString * const popularCell = @"popular";
NSString * const topRatedCell = @"topRated";
NSString * const upcomingCell = @"upcoming";
NSString * const getReq = @"GET";
NSString * const titleCellIdentifier = @"title";
NSString * const detailCellIdentifier = @"DetailMovieViewController";
NSString * const posterImgUrl = @"https://image.tmdb.org/t/p/original%@";
NSString * const searchCellIdentifier = @"searchCell";
NSString * const profileText = @"Profile";
NSString * const profileUserName = @"Abhay Raj";
NSString * const profileImg = @"profileImg.png";
NSString * const popconImg = @"popcorn.jpeg";
NSString * const profileTableViewIdentifier = @"ProfileTableViewCell";
NSString * const errorText = @"Error";
NSString * const ratingtText = @"Rating: ";

@end;

