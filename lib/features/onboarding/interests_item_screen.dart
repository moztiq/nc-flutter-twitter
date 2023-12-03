import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';
import 'package:nc_flutter_twitter/features/authentication/signup_intro_screen.dart';
import 'package:nc_flutter_twitter/features/onboarding/widgets/interest_button.dart';
import 'package:nc_flutter_twitter/features/onboarding/widgets/interest_item_button.dart';
import 'package:nc_flutter_twitter/features/onboarding/widgets/interest_section.dart';

const musicGenres = [
  "Rock",
  "Jazz",
  "Classical",
  "Hip-Hop",
  "Blues",
  "Electronic",
  "Country",
  "Reggae",
  "Folk",
  "Pop",
  "Metal",
  "Soul",
  "Opera",
  "Punk",
  "Latin",
];

const movieGenres = [
  "Action",
  "Comedy",
  "Drama",
  "Horror",
  "Science Fiction",
  "Fantasy",
  "Thriller",
  "Romance",
  "Documentary",
  "Mystery",
  "Western",
  "Musical",
  "Animation",
  "Crime",
  "Biographical",
];

const sportsGenres = [
  "Soccer",
  "Basketball",
  "Baseball",
  "American Football",
  "Tennis",
  "Golf",
  "Cricket",
  "Rugby",
  "Swimming",
  "Boxing",
  "Track and Field",
  "Hockey",
  "Cycling",
  "Martial Arts",
  "Skiing",
];

class InterestsItemScreen extends StatefulWidget {
  const InterestsItemScreen({super.key});

  @override
  State<InterestsItemScreen> createState() => _InterestsItemScreenState();
}

class _InterestsItemScreenState extends State<InterestsItemScreen> {
  List _selectedMusicList = [];
  List _selectedMovieList = [];
  List _selectedSportsList = [];

  bool _isActive() {
    if (_selectedMusicList.isEmpty ||
        _selectedMovieList.isEmpty ||
        _selectedSportsList.isEmpty) return false;
    return true;
  }

  void _onSelectMusic(selectedList) {
    _selectedMusicList = selectedList;
    setState(() {});
  }

  void _onSelectMovie(selectedList) {
    _selectedMovieList = selectedList;
    setState(() {});
  }

  void _onSelectSports(selectedList) {
    _selectedSportsList = selectedList;
    setState(() {});
  }

  void _onSubmit() {
    if (!_isActive()) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignupIntroScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size32,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v28,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size32,
              ),
              child: Text(
                "What do you want to see on Twitter?",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Gaps.v14,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size32,
              ),
              child: Text(
                "Interests are used to personalize your experience and will be visible on your profile.",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: Sizes.size16,
                ),
              ),
            ),
            Gaps.v48,
            InterestSection(
              title: 'Music',
              interests: musicGenres,
              onSelect: _onSelectMusic,
            ),
            InterestSection(
              title: 'Movie',
              interests: movieGenres,
              onSelect: _onSelectMovie,
            ),
            InterestSection(
              title: 'Sports',
              interests: sportsGenres,
              onSelect: _onSelectSports,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: _onSubmit,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size8,
                  horizontal: Sizes.size24,
                ),
                decoration: BoxDecoration(
                  color: _isActive() ? Colors.black : Colors.grey.shade500,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: Sizes.size1,
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizes.size28,
                  ),
                ),
                child: const Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
