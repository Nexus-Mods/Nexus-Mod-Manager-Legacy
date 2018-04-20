using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using Nexus.Client.Util;
using Nexus.UI.Controls;

namespace Nexus.Client.Updating
{
	/// <summary>
	/// Updates the programme.
	/// </summary>
	public class ProgrammeUpdater : UpdaterBase
	{
		private bool m_booIsAutoCheck = false;
		private string m_strUpdateUrlLegacy = "http://dev.nexusmods.com/client/legacy/";
		private string m_strUpdateUrl45 = "http://dev.nexusmods.com/client/4.5/";
		private bool m_booForceLegacy = (Environment.OSVersion.Version.Major <= 5);

		#region Properties

		/// <summary>
		/// Gets the updater's name.
		/// </summary>
		/// <value>The updater's name.</value>
		public override string Name
		{
			get
			{
				return String.Format("{0} Updater", EnvironmentInfo.Settings.ModManagerName);
			}
		}

		#endregion

		#region Constructors

		/// <summary>
		/// A simple constructor that initializes the object with the given values.
		/// </summary>
		/// <param name="p_eifEnvironmentInfo">The application's envrionment info.</param>
		/// <param name="p_booIsAutoCheck">Whether the check is automatic or user requested.</param>
		public ProgrammeUpdater(IEnvironmentInfo p_eifEnvironmentInfo, bool p_booIsAutoCheck)
			: base(p_eifEnvironmentInfo)
		{
			m_booIsAutoCheck = p_booIsAutoCheck;
			SetRequiresRestart(true);
		}

		#endregion

		/// <summary>
		/// Performs the update.
		/// </summary>
		/// <returns><c>true</c> if the update completed successfully;
		/// <c>false</c> otherwise.</returns>
		public override bool Update()
		{
			bool booUpgrade = false;
			Trace.TraceInformation("Checking for new client version...");
			Trace.Indent();
			SetProgressMaximum(4);
			string strDownloadUri = String.Empty;
			Version verNew = new Version("0.0.0");
			if (!m_booForceLegacy && !(!EnvironmentInfo.Settings.IgnoreAlternateVersion && m_booIsAutoCheck))
			{
				SetProgress(1);

				SetMessage(String.Format("Checking for new {0} official version...", EnvironmentInfo.Settings.ModManagerName));
				verNew = GetNewProgrammeVersion(m_strUpdateUrl45 + "latestversion.php", out strDownloadUri);
				if (!((verNew == new Version("0.0.0")) || (verNew == new Version("69.69.69.69"))))
				{
					StringBuilder stbUpgradePromptMessage = new StringBuilder();
					DialogResult drUpgradeResult = DialogResult.No;

					stbUpgradePromptMessage.AppendFormat("A new official version of {0} is available ({1}).{2}Would you like to download the upgrade and install it?", EnvironmentInfo.Settings.ModManagerName, verNew, Environment.NewLine).AppendLine();
					stbUpgradePromptMessage.AppendLine();
					stbUpgradePromptMessage.AppendLine("Click NO if you wish to stick to the legacy version.");
					stbUpgradePromptMessage.AppendLine("Should you change your mind you can click the 'Update Nexus Mod Manager' button on the top right corner of the UI.");
					stbUpgradePromptMessage.AppendLine();
					stbUpgradePromptMessage.AppendLine("NOTE: Installation of the .Net Framework 4.5 is mandatory for the new version to work:");
					stbUpgradePromptMessage.AppendLine("http://go.microsoft.com/fwlink/?LinkId=225702");
					stbUpgradePromptMessage.AppendLine();
					stbUpgradePromptMessage.AppendLine();
					stbUpgradePromptMessage.AppendLine("You can find the change log for the new release here:");
					stbUpgradePromptMessage.AppendLine("http://forums.nexusmods.com/index.php?/topic/896029-nexus-mod-manager-release-notes/");

					try
					{
						//the extended message box contains an activex control wich must be run in an STA thread,
						// we can't control what thread this gets called on, so create one if we need to
						ThreadStart actShowMessage = () => drUpgradeResult = ExtendedMessageBox.Show(null, stbUpgradePromptMessage.ToString(), "Upgrade available", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
						ApartmentState astState = ApartmentState.Unknown;
						Thread.CurrentThread.TrySetApartmentState(astState);
						if (astState == ApartmentState.STA)
							actShowMessage();
						else
						{
							Thread thdMessage = new Thread(actShowMessage);
							thdMessage.SetApartmentState(ApartmentState.STA);
							thdMessage.Start();
							thdMessage.Join();
						}

					}
					catch
					{
					}

					SetProgress(2);

					if (drUpgradeResult == DialogResult.Cancel)
					{
						Trace.Unindent();
						return CancelUpdate();
					}
					else if (drUpgradeResult == DialogResult.No)
					{
						EnvironmentInfo.Settings.IgnoreAlternateVersion = true;
						EnvironmentInfo.Settings.Save();
						strDownloadUri = String.Empty;
					}
					else
						booUpgrade = true;
				}
			}

			if (!booUpgrade)
			{
				SetMessage(String.Format("Checking for new {0} legacy version...", EnvironmentInfo.Settings.ModManagerName));
				verNew = GetNewProgrammeVersion(m_strUpdateUrlLegacy + "latestversion.php", out strDownloadUri);

				SetProgress(3);

				if (CancelRequested)
				{
					Trace.Unindent();
					return CancelUpdate();
				}

				if (verNew == new Version("69.69.69.69"))
				{
					SetMessage("Could not get version information from the update server.");
					return false;
				}

				StringBuilder stbPromptMessage = new StringBuilder();
				DialogResult drResult = DialogResult.No;

				if (verNew > new Version(ProgrammeMetadata.VersionString))
				{
					stbPromptMessage.AppendFormat("A new legacy version of {0} is available ({1}).{2}Would you like to download and install it?", EnvironmentInfo.Settings.ModManagerName, verNew, Environment.NewLine).AppendLine();
					stbPromptMessage.AppendLine();
					stbPromptMessage.AppendLine();
					stbPromptMessage.AppendLine("NOTE: You can find the change log for the new release here:");
					stbPromptMessage.AppendLine("http://forums.nexusmods.com/index.php?/topic/1759486-nexus-mod-manager-legacy-release-notes/");

					try
					{
						//the extended message box contains an activex control wich must be run in an STA thread,
						// we can't control what thread this gets called on, so create one if we need to
						ThreadStart actShowMessage = () => drResult = ExtendedMessageBox.Show(null, stbPromptMessage.ToString(), "New version available", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
						ApartmentState astState = ApartmentState.Unknown;
						Thread.CurrentThread.TrySetApartmentState(astState);
						if (astState == ApartmentState.STA)
							actShowMessage();
						else
						{
							Thread thdMessage = new Thread(actShowMessage);
							thdMessage.SetApartmentState(ApartmentState.STA);
							thdMessage.Start();
							thdMessage.Join();
						}

					}
					catch
					{
					}

					if (drResult == DialogResult.Cancel)
					{
						Trace.Unindent();
						return CancelUpdate();
					}
				}
				else
				{
					if (!m_booIsAutoCheck)
					{
						stbPromptMessage.AppendFormat("{0} is already up to date.", EnvironmentInfo.Settings.ModManagerName).AppendLine();
						stbPromptMessage.AppendLine();
						stbPromptMessage.AppendLine();
						stbPromptMessage.AppendLine("NOTE: You can find the release notes, planned features and past versions here:");
						stbPromptMessage.AppendLine("http://forums.nexusmods.com/index.php?/topic/896029-nexus-mod-manager-release-notes/");

						try
						{
							//the extended message box contains an activex control wich must be run in an STA thread,
							// we can't control what thread this gets called on, so create one if we need to
							ThreadStart actShowMessage = () => drResult = ExtendedMessageBox.Show(null, stbPromptMessage.ToString(), "Up to date", MessageBoxButtons.OK, MessageBoxIcon.Information);
							ApartmentState astState = ApartmentState.Unknown;
							Thread.CurrentThread.TrySetApartmentState(astState);
							if (astState == ApartmentState.STA)
								actShowMessage();
							else
							{
								Thread thdMessage = new Thread(actShowMessage);
								thdMessage.SetApartmentState(ApartmentState.STA);
								thdMessage.Start();
								thdMessage.Join();
							}
						}
						catch
						{
						}
					}

					strDownloadUri = String.Empty;
				}
			}

			if (!String.IsNullOrEmpty(strDownloadUri) && (!((verNew == new Version("0.0.0")) || (verNew == new Version("69.69.69.69")))))
			{
				string strNewInstaller = String.Empty;

				SetMessage(String.Format("Downloading new {0} version...", EnvironmentInfo.Settings.ModManagerName));
				try
				{
					strNewInstaller = DownloadFile(new Uri(strDownloadUri));
				}
				catch (FileNotFoundException)
				{
					SetMessage("The update file is not present on the server.");
					return false;
				}

				SetProgress(4);

				if (CancelRequested)
				{
					Trace.Unindent();
					return CancelUpdate();
				}

				if (!String.IsNullOrEmpty(strNewInstaller))
				{
					string strOldPath = strNewInstaller;
					strNewInstaller = Path.Combine(Path.GetTempPath(), Path.GetFileName(strNewInstaller));
					FileUtil.ForceDelete(strNewInstaller);

					try
					{
						File.Move(strOldPath, strNewInstaller);
					}
					catch (FileNotFoundException)
					{
						DialogResult drError = DialogResult.No;
						StringBuilder stbAVMessage = new StringBuilder();
						stbAVMessage.AppendLine("Unable to find the downloaded update:");
						stbAVMessage.AppendLine("this could be caused by a network issue or by your anti-virus software deleting it falsely flagging the installer as a virus.");
						stbAVMessage.AppendLine("As a result you won't be able to automatically update the program.");
						stbAVMessage.AppendLine();
						stbAVMessage.AppendFormat("To fix this issue you need to add {0}'s executable and all its folders to your", EnvironmentInfo.Settings.ModManagerName).AppendLine();
						stbAVMessage.AppendLine("anti-virus exception list. You can also download the update manually from:");
						stbAVMessage.AppendLine("http://www.nexusmods.com/games/mods/modmanager/");

						try
						{
							//the extended message box contains an activex control wich must be run in an STA thread,
							// we can't control what thread this gets called on, so create one if we need to
							ThreadStart actShowMessage = () => drError = ExtendedMessageBox.Show(null, stbAVMessage.ToString(), "Unable to update", MessageBoxButtons.OK, MessageBoxIcon.Information);
							ApartmentState astState = ApartmentState.Unknown;
							Thread.CurrentThread.TrySetApartmentState(astState);
							if (astState == ApartmentState.STA)
								actShowMessage();
							else
							{
								Thread thdMessage = new Thread(actShowMessage);
								thdMessage.SetApartmentState(ApartmentState.STA);
								thdMessage.Start();
								thdMessage.Join();
							}

						}
						catch
						{
						}

						Trace.Unindent();
						return CancelUpdate();
					}

					SetMessage("Launching installer...");
					ProcessStartInfo psiInfo = new ProcessStartInfo(strNewInstaller);
					Process.Start(psiInfo);
					Trace.Unindent();
					return true;
				}
			}
			SetMessage(String.Format("{0} is already up to date.", EnvironmentInfo.Settings.ModManagerName));
			SetProgress(2);
			Trace.Unindent();
			return true;
		}

		/// <summary>
		/// Cancels the update.
		/// </summary>
		/// <remarks>
		/// This is a convience method that allows the setting of the message and
		/// the determination of the return value in one call.
		/// </remarks>
		/// <returns>Always <c>true</c>.</returns>
		private bool CancelUpdate()
		{
			SetMessage(String.Format("Cancelled {0} update.", EnvironmentInfo.Settings.ModManagerName));
			SetProgress(2);
			return true;
		}

		/// <summary>
		/// Gets the newest available programme version.
		/// </summary>
		/// <returns>The newest available programme version,
		/// or 69.69.69.69 if no information could be retrieved.</returns>
		private Version GetNewProgrammeVersion(string p_UpdateUri, out string p_strDownloadUri)
		{
			WebClient wclNewVersion = new WebClient();
			Version verNew = new Version("69.69.69.69");
			p_strDownloadUri = String.Empty;
			try
			{
				string strNewVersion = wclNewVersion.DownloadString(p_UpdateUri);
				if (!String.IsNullOrEmpty(strNewVersion))
				{
					verNew = new Version(strNewVersion.Split('|')[0]);
					p_strDownloadUri = strNewVersion.Split('|')[1];
				}
			}
			catch (WebException e)
			{
				Trace.TraceError(String.Format("Could not connect to update server: {0}", e.Message));
			}

			return verNew;
		}
	}
}
