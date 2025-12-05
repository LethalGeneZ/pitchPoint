<?php

use PHPUnit\Framework\TestCase;

class DeleteProjectActionTest extends TestCase
{
    private string $actionsPath;

    protected function setUp(): void
    {
        parent::setUp();
        $this->actionsPath = __DIR__ . '/../actions';
    }

    public function testDeleteProjectActionFileExists()
    {
        $file = $this->actionsPath . '/delete_project.php';
        $this->assertFileExists(
            $file,
            'delete_project.php should exist for deleting projects'
        );
    }

    public function testDeleteProjectFileContainsSqlDelete()
    {
        $file = $this->actionsPath . '/delete_project.php';
        $content = file_get_contents($file);

        $this->assertStringContainsString('DELETE', $content, 'delete_project.php should contain DELETE SQL command');
        $this->assertStringContainsString('WHERE', $content, 'delete_project.php should contain WHERE clause');
    }
}
