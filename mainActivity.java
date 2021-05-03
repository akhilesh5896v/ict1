package com.example.sportyapp;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.sportyapp.ui.admin.AdminDash;
import com.example.sportyapp.ui.coach.CoachDash;
import com.example.sportyapp.ui.player.PlayerDash;
import com.example.sportyapp.ui.selector.SelectorDash;
import com.example.sportyapp.users.Login;
import com.example.sportyapp.users.Signup;
import com.example.sportyapp.utils.SessionManager;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Objects;

public class MainActivity extends AppCompatActivity {
    // Declare variables
    TextView loginLink, signupLink;
    Button logoutBtn;
    String userType;
    boolean loggedIn;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize variables
        loginLink = findViewById(R.id.welcomeLogin);
        signupLink = findViewById(R.id.welcomeSignup);
        logoutBtn = findViewById(R.id.homeLogoutBtn);

        logoutBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SessionManager sessionManager = new SessionManager(MainActivity.this);
                sessionManager.logout();

                finish();
                startActivity(getIntent());
            }
        });

        loggedIn = checkAuth();
        if (loggedIn) {
            // Show the logout btn, hide login and signup links
            logoutBtn.setVisibility(View.VISIBLE);
            loginLink.setVisibility(View.GONE);
            signupLink.setVisibility(View.GONE);

            userType = getUserType();
            goToActivity(userType);
        } else {
            // Listen for click events
            loginLink.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // Set an intent to launch login screen
                    Intent loginIntent = new Intent(getApplicationContext(), Login.class);
                    startActivity(loginIntent);
                    finish();
                }
            });

            signupLink.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // Set an intent to launch login screen
                    Intent signupIntent = new Intent(getApplicationContext(), Signup.class);
                    startActivity(signupIntent);
                    finish();
                }
            });
        }
    }

    @Override
    protected void onResume() {
        super.onResume();

        loggedIn = checkAuth();
        if (loggedIn) {
            // Show the logout btn, hide login and signup links
            logoutBtn.setVisibility(View.VISIBLE);
            loginLink.setVisibility(View.GONE);
            signupLink.setVisibility(View.GONE);

            userType = getUserType();
            goToActivity(userType);
        }
    }

    @Override
    protected void onStart() {
        super.onStart();

        loggedIn = checkAuth();
        if (loggedIn) {
            // Show the logout btn, hide login and signup links
            logoutBtn.setVisibility(View.VISIBLE);
            loginLink.setVisibility(View.GONE);
            signupLink.setVisibility(View.GONE);

            userType = getUserType();
            goToActivity(userType);
        }
    }

    // Go to activity based on userType
    private void goToActivity(String userType) {
        switch (userType) {
            case "ADMIN":
                startActivity(new Intent(MainActivity.this, AdminDash.class));
                finish();
                break;
            case "COACH":
                startActivity(new Intent(MainActivity.this, CoachDash.class));
                finish();
                break;
            case "SELECTOR":
                startActivity(new Intent(MainActivity.this, SelectorDash.class));
                finish();
                break;
            case "PLAYER":
                startActivity(new Intent(MainActivity.this, PlayerDash.class));
                finish();
                break;
        }
    }

    // Get auth status from login session information
    private boolean checkAuth() {
        // Initialize the session
        SessionManager sessionManager = new SessionManager(MainActivity.this);
        return sessionManager.checkLogin();
    }

    // Get user type from login session information
    public String getUserType() {
        SessionManager sessionManager = new SessionManager(MainActivity.this);
        HashMap<String, String> userDetails = sessionManager.getSessionDetail();
        return userDetails.get(SessionManager.USER_TYPE);
    }
}
