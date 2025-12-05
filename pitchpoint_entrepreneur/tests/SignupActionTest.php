<?php

use PHPUnit\Framework\TestCase;

class SignupActionTest extends TestCase
{
    private string $path;

    protected function setUp(): void
    {
        parent::setUp();
        // signup.php is inside pitchpoint_entrepreneur/actions
        $this->path = __DIR__ . '/../actions/signup.php';
    }

    public function testFileExists()
    {
        $this->assertFileExists(
            $this->path,
            'signup.php should exist in the actions folder to handle registration'
        );
    }

    public function testSecurityChecksExist()
    {
        $content = file_get_contents($this->path);

        // Strict types + POST only + CSRF
        $this->assertStringContainsString('declare(strict_types=1);', $content, 'Strict types should be enabled');
        $this->assertStringContainsString('$_SERVER[\'REQUEST_METHOD\']', $content, 'Request method check (POST) should exist');
        $this->assertStringContainsString('csrf_validate', $content, 'CSRF validation should be present');
    }

    public function testValidationLogicExists()
    {
        $content = file_get_contents($this->path);

        // Basic field + password validation + duplicate email handling
        $this->assertStringContainsString('Please fill all required fields', $content, 'Required-fields validation message should exist');
        $this->assertStringContainsString('strlen($pass) < 6', $content, 'Password minimum length check should exist');
        $this->assertStringContainsString('Email already in use.', $content, 'Duplicate email error message should exist');
    }

    public function testDatabaseInsertQueriesExist()
    {
        $content = file_get_contents($this->path);

        // Insert into users + entrepreneurs
        $this->assertStringContainsString('INSERT INTO users', $content, 'INSERT INTO users query should exist');
        $this->assertStringContainsString('INSERT INTO entrepreneurs', $content, 'INSERT INTO entrepreneurs query should exist');
    }

    public function testLoginAndRedirectOnSuccessExist()
    {
        $content = file_get_contents($this->path);

        // Auto login + success flash + redirect
        $this->assertStringContainsString('login_user([', $content, 'New user should be logged in after signup');
        $this->assertStringContainsString('flash_set(\'success\'', $content, 'Success flash message should be set');
        $this->assertStringContainsString('redirect(base_url(', $content, 'Successful signup should redirect to base URL');
    }
}
