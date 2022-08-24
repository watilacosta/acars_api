class PirepsController < ApplicationController
  def index

  end

  private

  def pirep_params
    params.slice!(:user, :pass, :auth, :version, :aircraft, :atcModel, :atcData,
                  :lat1, :lon1, :lat2, :lon2, :latland, :lonland, :directNM,
                  :actualNM, :dateshort, :datestamp, :timeout, :timeoff, :timeon,
                  :timein, :fstimeout, :fstimeoff, :fstimeon, :fstimein,
                  :blocktime, :fuelstart, :fuelstop, :fueldiff, :timoday,
                  :landingFR, :landingKTS, :landingFPM, :takeoffLBS, :landingLBS,
                  :pirep, :pause, :slew, :stall, :overspeed, :speed10k, :simrate,
                  :refuel, :crashed, :nofuel, :warpNM, :MILdiffLBS, :lsotxt,
                  :lsonum, :takeoffFR, :windstart, :windstop, :payload,
                  :fsVersion, :oew, :zfw, :rollout, :blockfuel, :enroutefuel,
                  :taxifuel, :gmax, :gmin, :takeoffHWC, :takeoffXWC, :landingHWC,
                  :landingXWC, :hwavg, :takeoffflaps, :landingflaps, :omaxtaxi,
                  :dmaxtaxi, :takeoffKTS, :trueheading, :multifpm )

  end
end
