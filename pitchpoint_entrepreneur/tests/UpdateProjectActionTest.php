<?php

use PHPUnit\Framework\TestCase;

class UpdateProjectActionTest extends TestCase
{
    private string $path;

    protected function setUp(): void
    {
        parent::setUp();
        // File inside pitchpoint_entrepreneur/actions
        $this->path = __DIR__ . '/../actions/update_project.php';
    }

    public function testFileExists()
    {
        $this->assertFileExists(
            $this->path,
            'update_project.php should exist in actions folder'
        );
    }

    public function testSecurityChecksExist()
    {
        $content = file_get_contents($this->path);

        $this->assertStringContainsString('require_login', $content, 'require_login() missing');
        $this->assertStringContainsString('csrf_validate', $content, 'CSRF validation missing');
        $this->assertStringContainsString('POST', $content, 'POST method enforcement missing');
    }

    public function testInputValidationExists()
    {
        $content = file_get_contents($this->path);

        $this->assertStringContainsString('project_id', $content, 'project_id validation missing');
        $this->assertStringContainsString('title', $content, 'title field missing');
    }

    public function testSQLUpdateQueriesExist()
    {
        $content = file_get_contents($this->path);

        $this->assertStringContainsString('UPDATE projects', $content, 'UPDATE query for projects missing');
        $this->assertStringContainsString('INSERT INTO project_files', $content, 'INSERT for uploaded files missing');
    }

    public function testUploadLogicExists()
    {
        $content = file_get_contents($this->path);

        $this->assertStringContainsString('$_FILES', $content, 'File upload handling missing');
        $this->assertStringContainsString('move_uploaded_file', $content, 'move_uploaded_file missing');
    }
}
