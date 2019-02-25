/**
 * Holds info about a team in a competition standings/table
 */
class StandingsInfo {
  int position;
  String name;
  int points;
  int pointsDiff;

  StandingsInfo(this.position, this.name, this.points, this.pointsDiff);

  @override
  String toString(){
    return "Position: $position, Name: $name, Points: $points, PointsDiff: $pointsDiff";
  }
}