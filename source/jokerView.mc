import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.Time.Gregorian;

class jokerView extends WatchUi.WatchFace {

    var customFont = null;

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {

    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        time(dc);
        date(dc);
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

    function date(dc as Dc){
        var today_date = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);

        var date_view = View.findDrawableById("Date") as Text;
        var date_day_view = View.findDrawableById("DateDay") as Text;
        var date_month_view = View.findDrawableById("DateMonth") as Text;

        date_view.setText(Lang.format("$1$", [today_date.day.format("%02d")]));
        date_month_view.setText(today_date.month);
        date_day_view.setText(today_date.day_of_week);
    }

    function time (dc as Dc) {
        var clockTime = System.getClockTime();

        var hour_view = View.findDrawableById("TimeHour") as Text;
        var min_view = View.findDrawableById("TimeMin") as Text;

        hour_view.setText(Lang.format("$1$", [clockTime.hour.format("%02d")]));
        min_view.setText(Lang.format("$1$", [clockTime.min.format("%02d")]));
    }

}
