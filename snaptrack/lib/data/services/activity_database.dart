import '../models/activity_entry.dart';

class ActivityDatabase {
  static const List<Map<String, dynamic>> _activities = [
    // Cardio Activities
    {'name': 'Running (9.7 km/h)', 'met': 9.8, 'category': 'cardio', 'description': 'Running at moderate pace'},
    {'name': 'Running (12.9 km/h)', 'met': 11.8, 'category': 'cardio', 'description': 'Running at fast pace'},
    {'name': 'Running (16.1 km/h)', 'met': 14.5, 'category': 'cardio', 'description': 'Running at very fast pace'},
    {'name': 'Jogging', 'met': 7.0, 'category': 'cardio', 'description': 'General jogging'},
    {'name': 'Walking (3.2 km/h)', 'met': 2.8, 'category': 'cardio', 'description': 'Slow walking'},
    {'name': 'Walking (4.8 km/h)', 'met': 3.5, 'category': 'cardio', 'description': 'Moderate walking'},
    {'name': 'Walking (6.4 km/h)', 'met': 5.0, 'category': 'cardio', 'description': 'Brisk walking'},
    {'name': 'Walking uphill', 'met': 6.0, 'category': 'cardio', 'description': 'Walking on incline'},
    {'name': 'Treadmill walking', 'met': 4.3, 'category': 'cardio', 'description': 'Walking on treadmill'},
    {'name': 'Treadmill running', 'met': 8.0, 'category': 'cardio', 'description': 'Running on treadmill'},
    
    // Cycling
    {'name': 'Cycling (19-23 km/h)', 'met': 8.0, 'category': 'cardio', 'description': 'Moderate cycling'},
    {'name': 'Cycling (23-26 km/h)', 'met': 10.0, 'category': 'cardio', 'description': 'Vigorous cycling'},
    {'name': 'Cycling (26-31 km/h)', 'met': 12.0, 'category': 'cardio', 'description': 'Fast cycling'},
    {'name': 'Cycling (>32 km/h)', 'met': 16.0, 'category': 'cardio', 'description': 'Racing cycling'},
    {'name': 'Stationary bike (moderate)', 'met': 6.8, 'category': 'cardio', 'description': 'Moderate stationary cycling'},
    {'name': 'Stationary bike (vigorous)', 'met': 8.8, 'category': 'cardio', 'description': 'Vigorous stationary cycling'},
    {'name': 'Mountain biking', 'met': 8.5, 'category': 'cardio', 'description': 'Off-road cycling'},
    
    // Swimming
    {'name': 'Swimming (slow)', 'met': 6.0, 'category': 'water', 'description': 'Leisurely swimming'},
    {'name': 'Swimming (moderate)', 'met': 8.3, 'category': 'water', 'description': 'Moderate swimming'},
    {'name': 'Swimming (fast)', 'met': 10.0, 'category': 'water', 'description': 'Vigorous swimming'},
    {'name': 'Swimming laps (freestyle)', 'met': 8.0, 'category': 'water', 'description': 'Freestyle swimming'},
    {'name': 'Swimming (backstroke)', 'met': 8.0, 'category': 'water', 'description': 'Backstroke swimming'},
    {'name': 'Swimming (breaststroke)', 'met': 10.3, 'category': 'water', 'description': 'Breaststroke swimming'},
    {'name': 'Swimming (butterfly)', 'met': 13.8, 'category': 'water', 'description': 'Butterfly stroke'},
    {'name': 'Water aerobics', 'met': 4.0, 'category': 'water', 'description': 'Water-based exercises'},
    {'name': 'Water jogging', 'met': 9.8, 'category': 'water', 'description': 'Running in water'},
    
    // Strength Training
    {'name': 'Weight lifting (light)', 'met': 3.0, 'category': 'strength', 'description': 'Light weight training'},
    {'name': 'Weight lifting (moderate)', 'met': 5.0, 'category': 'strength', 'description': 'Moderate weight training'},
    {'name': 'Weight lifting (vigorous)', 'met': 6.0, 'category': 'strength', 'description': 'Heavy weight training'},
    {'name': 'Bodyweight exercises', 'met': 4.3, 'category': 'strength', 'description': 'Push-ups, sit-ups, etc.'},
    {'name': 'Circuit training', 'met': 8.0, 'category': 'strength', 'description': 'High-intensity circuit'},
    {'name': 'CrossFit', 'met': 12.0, 'category': 'strength', 'description': 'High-intensity functional fitness'},
    {'name': 'Pull-ups', 'met': 8.0, 'category': 'strength', 'description': 'Pull-up exercises'},
    {'name': 'Push-ups', 'met': 3.8, 'category': 'strength', 'description': 'Push-up exercises'},
    {'name': 'Squats', 'met': 5.0, 'category': 'strength', 'description': 'Squat exercises'},
    {'name': 'Deadlifts', 'met': 6.0, 'category': 'strength', 'description': 'Deadlift exercises'},
    {'name': 'Bench press', 'met': 5.5, 'category': 'strength', 'description': 'Bench pressing'},
    
    // Sports
    {'name': 'Basketball (game)', 'met': 8.0, 'category': 'sports', 'description': 'Competitive basketball'},
    {'name': 'Basketball (shooting)', 'met': 4.5, 'category': 'sports', 'description': 'Shooting baskets'},
    {'name': 'Soccer (competitive)', 'met': 10.0, 'category': 'sports', 'description': 'Competitive soccer'},
    {'name': 'Soccer (casual)', 'met': 7.0, 'category': 'sports', 'description': 'Recreational soccer'},
    {'name': 'Tennis (singles)', 'met': 8.0, 'category': 'sports', 'description': 'Singles tennis'},
    {'name': 'Tennis (doubles)', 'met': 6.0, 'category': 'sports', 'description': 'Doubles tennis'},
    {'name': 'Badminton', 'met': 5.5, 'category': 'sports', 'description': 'Badminton game'},
    {'name': 'Volleyball', 'met': 4.0, 'category': 'sports', 'description': 'Volleyball game'},
    {'name': 'Beach volleyball', 'met': 8.0, 'category': 'sports', 'description': 'Beach volleyball'},
    {'name': 'Baseball', 'met': 5.0, 'category': 'sports', 'description': 'Baseball game'},
    {'name': 'Football (American)', 'met': 8.0, 'category': 'sports', 'description': 'American football'},
    {'name': 'Hockey', 'met': 8.0, 'category': 'sports', 'description': 'Ice hockey'},
    {'name': 'Golf (walking)', 'met': 4.8, 'category': 'sports', 'description': 'Golf with walking'},
    {'name': 'Golf (cart)', 'met': 3.5, 'category': 'sports', 'description': 'Golf with cart'},
    {'name': 'Bowling', 'met': 3.0, 'category': 'sports', 'description': 'Bowling'},
    {'name': 'Table tennis', 'met': 4.0, 'category': 'sports', 'description': 'Ping pong'},
    {'name': 'Racquetball', 'met': 7.0, 'category': 'sports', 'description': 'Racquetball game'},
    {'name': 'Squash', 'met': 12.0, 'category': 'sports', 'description': 'Squash game'},
    
    // Flexibility & Mind-Body
    {'name': 'Yoga (Hatha)', 'met': 2.5, 'category': 'flexibility', 'description': 'Gentle yoga'},
    {'name': 'Yoga (Vinyasa)', 'met': 4.0, 'category': 'flexibility', 'description': 'Flow yoga'},
    {'name': 'Yoga (Power)', 'met': 4.0, 'category': 'flexibility', 'description': 'Vigorous yoga'},
    {'name': 'Pilates', 'met': 3.0, 'category': 'flexibility', 'description': 'Pilates exercises'},
    {'name': 'Stretching', 'met': 2.3, 'category': 'flexibility', 'description': 'Stretching exercises'},
    {'name': 'Tai Chi', 'met': 4.0, 'category': 'flexibility', 'description': 'Tai Chi practice'},
    {'name': 'Meditation', 'met': 1.3, 'category': 'flexibility', 'description': 'Seated meditation'},
    
    // Dance
    {'name': 'Dancing (ballroom)', 'met': 3.0, 'category': 'cardio', 'description': 'Ballroom dancing'},
    {'name': 'Dancing (aerobic)', 'met': 7.3, 'category': 'cardio', 'description': 'Aerobic dancing'},
    {'name': 'Dancing (fast)', 'met': 5.0, 'category': 'cardio', 'description': 'Fast dancing'},
    {'name': 'Zumba', 'met': 8.8, 'category': 'cardio', 'description': 'Zumba fitness'},
    
    // Martial Arts
    {'name': 'Karate', 'met': 10.0, 'category': 'sports', 'description': 'Karate practice'},
    {'name': 'Judo', 'met': 10.0, 'category': 'sports', 'description': 'Judo practice'},
    {'name': 'Taekwondo', 'met': 10.0, 'category': 'sports', 'description': 'Taekwondo practice'},
    {'name': 'Mixed martial arts', 'met': 10.0, 'category': 'sports', 'description': 'MMA training'},
    {'name': 'Boxing', 'met': 12.8, 'category': 'sports', 'description': 'Boxing training'},
    {'name': 'Kickboxing', 'met': 10.0, 'category': 'sports', 'description': 'Kickboxing'},
    
    // Outdoor Activities
    {'name': 'Hiking', 'met': 6.0, 'category': 'cardio', 'description': 'Cross-country hiking'},
    {'name': 'Rock climbing', 'met': 11.0, 'category': 'strength', 'description': 'Rock climbing'},
    {'name': 'Skiing (downhill)', 'met': 6.0, 'category': 'sports', 'description': 'Downhill skiing'},
    {'name': 'Skiing (cross-country)', 'met': 9.0, 'category': 'cardio', 'description': 'Cross-country skiing'},
    {'name': 'Snowboarding', 'met': 5.3, 'category': 'sports', 'description': 'Snowboarding'},
    {'name': 'Skateboarding', 'met': 5.0, 'category': 'sports', 'description': 'Skateboarding'},
    {'name': 'Rollerblading', 'met': 7.5, 'category': 'cardio', 'description': 'Inline skating'},
    {'name': 'Ice skating', 'met': 7.0, 'category': 'cardio', 'description': 'Ice skating'},
    
    // Gym Equipment
    {'name': 'Elliptical machine', 'met': 5.0, 'category': 'cardio', 'description': 'Elliptical trainer'},
    {'name': 'Rowing machine', 'met': 7.0, 'category': 'cardio', 'description': 'Indoor rowing'},
    {'name': 'Stair climber', 'met': 9.0, 'category': 'cardio', 'description': 'Stair climbing machine'},
    {'name': 'Step aerobics', 'met': 7.0, 'category': 'cardio', 'description': 'Step aerobics'},
    
    // Household/Lifestyle
    {'name': 'Cleaning house', 'met': 3.3, 'category': 'other', 'description': 'General housework'},
    {'name': 'Gardening', 'met': 4.0, 'category': 'other', 'description': 'General gardening'},
    {'name': 'Yard work', 'met': 5.0, 'category': 'other', 'description': 'Yard maintenance'},
    {'name': 'Playing with children', 'met': 4.0, 'category': 'other', 'description': 'Active play with kids'},
    {'name': 'Walking dog', 'met': 3.0, 'category': 'other', 'description': 'Dog walking'},
    
    // Water Sports
    {'name': 'Surfing', 'met': 3.0, 'category': 'water', 'description': 'Surfing waves'},
    {'name': 'Windsurfing', 'met': 3.0, 'category': 'water', 'description': 'Windsurfing'},
    {'name': 'Kayaking', 'met': 5.0, 'category': 'water', 'description': 'Kayaking'},
    {'name': 'Canoeing', 'met': 4.0, 'category': 'water', 'description': 'Canoeing'},
    {'name': 'Water skiing', 'met': 6.0, 'category': 'water', 'description': 'Water skiing'},
    
    // Additional Activities
    {'name': 'Jumping rope', 'met': 11.0, 'category': 'cardio', 'description': 'Jump rope exercise'},
    {'name': 'Trampoline', 'met': 4.5, 'category': 'cardio', 'description': 'Trampoline jumping'},
    {'name': 'Horseback riding', 'met': 4.0, 'category': 'sports', 'description': 'Horseback riding'},
    {'name': 'Frisbee', 'met': 3.0, 'category': 'sports', 'description': 'Playing frisbee'},
    {'name': 'Ultimate frisbee', 'met': 8.0, 'category': 'sports', 'description': 'Competitive frisbee'},
    {'name': 'Fencing', 'met': 6.0, 'category': 'sports', 'description': 'Fencing sport'},
    {'name': 'Archery', 'met': 3.5, 'category': 'sports', 'description': 'Archery practice'},
    {'name': 'Fishing', 'met': 2.5, 'category': 'other', 'description': 'Fishing activity'},
    {'name': 'Hunting', 'met': 6.0, 'category': 'other', 'description': 'Hunting activity'},
  ];

  static List<Activity> getAllActivities() {
    return _activities.map((data) {
      return Activity.create(
        name: data['name'] as String,
        baseMET: (data['met'] as num).toDouble(),
        category: _parseCategory(data['category'] as String),
        description: data['description'] as String,
      );
    }).toList();
  }

  static List<Activity> getActivitiesByCategory(ActivityCategory category) {
    return getAllActivities()
        .where((activity) => activity.category == category)
        .toList();
  }

  static List<Activity> searchActivities(String query) {
    if (query.isEmpty) return getAllActivities();
    
    final lowercaseQuery = query.toLowerCase();
    return getAllActivities()
        .where((activity) =>
            activity.name.toLowerCase().contains(lowercaseQuery) ||
            activity.description.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  static Activity? getActivityByName(String name) {
    try {
      return getAllActivities()
          .firstWhere((activity) => activity.name == name);
    } catch (e) {
      return null;
    }
  }

  static List<Activity> getPopularActivities() {
    // Return most commonly used activities
    final popularNames = [
      'Walking (4.8 km/h)',
      'Running (9.7 km/h)',
      'Cycling (19-23 km/h)',
      'Swimming (moderate)',
      'Weight lifting (moderate)',
      'Yoga (Vinyasa)',
      'Basketball (game)',
      'Dancing (aerobic)',
      'Hiking',
      'Elliptical machine',
    ];

    return popularNames
        .map((name) => getActivityByName(name))
        .where((activity) => activity != null)
        .cast<Activity>()
        .toList();
  }

  static ActivityCategory _parseCategory(String category) {
    switch (category.toLowerCase()) {
      case 'cardio':
        return ActivityCategory.cardio;
      case 'strength':
        return ActivityCategory.strength;
      case 'sports':
        return ActivityCategory.sports;
      case 'flexibility':
        return ActivityCategory.flexibility;
      case 'water':
        return ActivityCategory.water;
      default:
        return ActivityCategory.other;
    }
  }

  static Map<ActivityCategory, List<Activity>> getActivitiesGroupedByCategory() {
    final grouped = <ActivityCategory, List<Activity>>{};
    
    for (final category in ActivityCategory.values) {
      grouped[category] = getActivitiesByCategory(category);
    }
    
    return grouped;
  }
}