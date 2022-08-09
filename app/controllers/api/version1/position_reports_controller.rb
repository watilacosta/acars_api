# $user      =  $_GET['user'];      //username
# $pass      =  $_GET['pass'];      //user password
# $auth      =  $_GET['auth'];      //auth code
# $lat1      =  $_GET['lat1'];      //starting latitude
# $lon1      =  $_GET['lon1'];      //starting longitude
# $lat2      =  $_GET['lat2'];      //current latitude
# $lon2      =  $_GET['lon2'];      //current longitude
# $msl       =  $_GET['msl'];       //current altitude , MSL, feet
# $gskts     =  $_GET['gskts'];     //current ground speed, knots
# $hdgtrue   =  $_GET['hdgtrue'];   //true heading, degrees
# $etime     =  $_GET['etime'];     //elapsed time, decimal hours
# $titleline =  $_GET['titleline']; //aircraft model from title in aircraft.cfg
# $onground  =  $_GET['onground'];  //1=on ground
class PositionReportsController < ApplicationController
  def index;end
end
