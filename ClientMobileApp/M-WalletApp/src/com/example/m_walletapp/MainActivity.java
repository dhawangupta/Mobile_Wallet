package com.example.m_walletapp;

import android.support.v7.app.ActionBarActivity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends ActionBarActivity {
	Button reqBtn;
	EditText number, amount;

	@Override
	protected void onCreate(Bundle savedInstanceState) {

		//
		requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_request_money);
		getWindow().setFeatureInt(Window.FEATURE_CUSTOM_TITLE,
				R.layout.my_custom_title);

		setTitle("M-Wallet App");
		

		reqBtn = (Button) findViewById(R.id.reqBtn);
		number = (EditText) findViewById(R.id.mobNo);
		amount = (EditText) findViewById(R.id.amt);

		reqBtn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				requestMoney(v);

			}
		});

	}

	void requestMoney(View view) {
		// test
		Log.d("CHECK on click", "on clicked");
		if (LoginActivity.sessionId <= 0) {
			Intent login = new Intent(getBaseContext(), LoginActivity.class);
			startActivity(login);
		} else {

			// actual logic
			if (number.getText().toString().isEmpty()) {
				Log.d("error", "Invalid Number");
				number.requestFocus();
				number.setError("Invalid Number");
				// logic to check number in db
				// return "Invalid Number(Not exists in M-wallet";
			} else if (amount.getText().toString().isEmpty()) {
				Log.d("Invalidamt", "Invalid Amount");
				amount.requestFocus();
				amount.setError("Invalid Amount");
				// return "Invalid amount";
			} else {
				Log.d("valid", "success" + "Requested amt:"
						+ amount.getText().toString());
				// return
				// "success"+"Requested amt:"+amount.getText().toString();
			}

		}
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
