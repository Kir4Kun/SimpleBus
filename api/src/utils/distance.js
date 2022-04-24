"use strict";
exports.__esModule = true;
exports.calculateDistance = void 0;
function calculateDistance(_a) {
    var lat1 = _a.lat1, lat2 = _a.lat2, lon1 = _a.lon1, lon2 = _a.lon2;
    var R = 6371e3; // metres
    var φ1 = lat1 * Math.PI / 180; // φ, λ in radians
    var φ2 = lat2 * Math.PI / 180;
    var Δφ = (lat2 - lat1) * Math.PI / 180;
    var Δλ = (lon2 - lon1) * Math.PI / 180;
    var a = Math.sin(Δφ / 2) * Math.sin(Δφ / 2) +
        Math.cos(φ1) * Math.cos(φ2) *
            Math.sin(Δλ / 2) * Math.sin(Δλ / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c; // in metres
    return d;
}
exports.calculateDistance = calculateDistance;
