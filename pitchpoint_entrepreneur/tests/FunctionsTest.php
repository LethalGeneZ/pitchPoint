<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

// Load your helper functions
require dirname(__DIR__) . '/includes/functions.php';

final class FunctionsTest extends TestCase
{
    /** @test */
    public function base_url_returns_string(): void
    {
        $url = base_url('test.php');

        $this->assertIsString($url);
        $this->assertStringContainsString(
            'test.php',
            $url,
            'base_url() should append the given path.'
        );
    }

    /** @test */
    public function h_escapes_html_characters(): void
    {
        $escaped = h('<script>');

        $this->assertSame(
            '&lt;script&gt;',
            $escaped,
            'h() should escape HTML tags.'
        );
    }

    /** @test */
    public function csrf_token_returns_non_empty_string(): void
    {
        $token = csrf_token();

        $this->assertIsString($token, 'csrf_token() should return a string.');
        $this->assertNotEmpty($token, 'csrf_token() should not be empty.');
    }

    /** @test */
    public function csrf_validate_returns_true_for_valid_token(): void
    {
        // Use a fresh token from the same request/session
        $token = csrf_token();

        $this->assertTrue(
            csrf_validate($token),
            'csrf_validate() should return true for a valid token.'
        );
    }

    /** @test */
    public function csrf_validate_returns_false_for_invalid_token(): void
    {
        $this->assertFalse(
            csrf_validate('this_is_an_invalid_token_123'),
            'csrf_validate() should return false for an invalid token.'
        );
    }
}
