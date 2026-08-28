import 'package:flutter/material.dart';

/// Outlet Manager App Color Tokens
/// These are the ONLY colors allowed in the app.
/// Do NOT introduce any new colors outside of this file.

/// Primary brand colors: Black & White
const kPrimaryColor = Color(0xFF000000); // Black
const kPrimaryLightColor = Color(0xFFFFFFFF); // White

/// Secondary/Accent color: Purple
/// Use for interactive elements (buttons, toggles, active tabs, focused fields, links, highlights)
const kSecondaryColor = Color(0xFF4B2E83); // Purple
const kSecondaryLightColor = Color(0xFFF1E6FF); // Light Purple

/// Secondary warm highlight color
/// Use ONLY for subtle warm highlights (badges, info chips, limited callouts)
/// NEVER use as a button background
const kSecondaryColor2 = Color(0xFFFFEAC9); // Warm beige/peach

/// Error/Destructive color
/// Use ONLY for errors, failed status, validation errors, and destructive actions (delete)
const kRedColor = Color(0xFFD50000); // Red

/// Background color
/// Use for scaffold backgrounds in light mode
const kBackground = Color(0xFFF5F5F3); // Off-white canvas

/// Text colors
const kTextDark = Color(0xFF111111); // Nearly black for primary text
const kTextMuted = Color(0xFF6F6F6B); // Gray for secondary text
const kTextFaint = Color(0xFF9A9A96); // Lighter gray for captions/labels
const kTextLight = Color(0xFFFFFFFF); // White for text on dark surfaces

/// Hairline border used on cards, inputs, and bordered surfaces
const kBorderColor = Color(0xFFE7E7E3);

/// Semantic status colors (success / warning), alongside kRedColor (danger)
/// and kSecondaryColor (info/accent).
const kSuccessColor = Color(0xFF2E7D32);
const kSuccessBg = Color(0xFFE6F4EA);
const kSuccessText = Color(0xFF1E6B2C);

const kWarningColor = Color(0xFFB45309);
const kWarningBg = Color(0xFFFFEAC9);
const kWarningText = Color(0xFF8A5A00);
